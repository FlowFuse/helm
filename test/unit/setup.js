const { exec } = require('child_process')
const { join } = require('path')
const yaml = require('yaml')

async function setup () {
    const rootDir = join(__dirname, '../../helm')
    const testDir = join(__dirname, '..')
    const child = exec([
        'helm',
        'template',
        'flowforge',
        'flowforge',
        '-f',
        `${testDir}/customizations.yml`
    ].join(' '), {
        cwd: rootDir
    })

    const promise = new Promise((resolve, reject) => {
        let stdout = ''
        let stderr = ''

        child.stdout.on('data', data => {
            // console.log('out', data)
            stdout += data
        })

        child.stderr.on('data', data => {
            // console.log('err:', data)
            stderr += data
        })

        child.on('exit', (code) => {
            // console.log(stdout)
            // console.log(stderr)
            // console.log('exit', code)
            if (code === 0) {
                const documents = yaml.parseAllDocuments(stdout)
                const docs = documents.map(d => d.toJS())
                resolve({
                    docs
                })
            } else {
                const err = new Error(stderr)
                reject(err, code)
            }
        })
    })
    return promise
}

module.exports = setup
