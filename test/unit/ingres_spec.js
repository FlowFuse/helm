const should = require('should') // eslint-disable-line
const setup = require('./setup')

describe('Examine Ingress',  function () {

    let configMaps
    let services
    let ingresses
    let deployments
    before(async function () {
       const { docs } = await setup()
       configMaps = docs.filter(d => d && d.kind === 'ConfigMap')
       services = docs.filter(d => d && d.kind === 'Service')
       ingresses = docs.filter(d => d && d.kind === 'Ingress')
       deployments = docs.filter(d => d && d.kind === 'Deployment')
    })

    describe('flowforge', function () {
        it('has ingres', function () {
            const ingress = ingresses.filter( s => s.metadata.name === 'flowforge-ingress')
            ingress.should.have.length(1)
        })
    })

    describe('broker', function () {
        it('has ingres', function () {
            const ingress = ingresses.filter( s => s.metadata.name === 'flowforge-broker')
            ingress.should.have.length(1)
        })
    })
})