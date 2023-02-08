const should = require('should') // eslint-disable-line
const setup = require('./setup')

describe('Examine Services', function () {
    let services
    before(async function () {
        const { docs } = await setup()
        services = docs.filter(d => d && d.kind === 'Service')
    })

    describe('flowforge', function () {
        it('has service', function () {
            const service = services.filter(s => s.metadata.name === 'forge')
            service.should.have.length(1)
        })
    })

    describe('file-server', function () {
        it('has service', function () {
            const service = services.filter(s => s.metadata.name === 'flowforge-file')
            service.should.have.length(1)
        })
    })

    describe('broker', function () {
        it('has service', function () {
            const service = services.filter(s => s.metadata.name === 'flowforge-broker')
            service.should.have.length(1)
        })
    })
})
