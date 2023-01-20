const should = require('should') // eslint-disable-line
const setup = require('./setup')
// const yaml = require('yaml')

describe('Examine Services',  function () {

    let configMaps
    let services
    let ingresse
    let deployments
    before(async function () {
       const { docs } = await setup()
       configMaps = docs.filter(d => d && d.kind === 'ConfigMap')
       services = docs.filter(d => d && d.kind === 'Service')
       ingresses = docs.filter(d => d && d.kind === 'Ingress')
       deployments = docs.filter(d => d && d.kind === 'Deployment')
    })

    describe('flowforge', function () {
        it('has service', function () {
            const service = services.filter( s => s.metadata.name === 'forge')
            service.should.have.length(1)
        })
    })

    describe('file-server', function () {
        it('has service', function () {
            const service = services.filter( s => s.metadata.name === 'flowforge-file')
            service.should.have.length(1)
        })
    })

    describe('broker', function () {
        it('has service', function () {
            const service = services.filter( s => s.metadata.name === 'flowforge-broker')
            service.should.have.length(1)
        })
    })
})