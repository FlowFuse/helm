const should = require('should') // eslint-disable-line
const setup = require('./setup')

describe('Examine Ingress',  function () {

    let ingresses
    before(async function () {
       const { docs } = await setup()
       ingresses = docs.filter(d => d && d.kind === 'Ingress')
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