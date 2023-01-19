const should = require('should') // eslint-disable-line
const setup = require('./setup')
const yaml = require('yaml')

describe('Examine Config Maps',  function () {

    let configMaps
    let services
    let ingresse
    let deployments
    before(async function () {
       const { docs } = await setup()
       configMaps = docs.filter(d => d.kind === 'ConfigMap')
       services = docs.filter(d => d.kind === 'Service')
       ingresses = docs.filter(d => d.kind === 'Ingress')
       deployments = docs.filter(d => d.kind === 'Deployment')
    })


    describe('FlowForge.yml',  async function () {
        let ff_yml
        beforeEach(function () {
            const d = configMaps.filter( doc => doc.metadata.name === 'flowforge-config')[0]
            ff_yml = yaml.parse(d.data['flowforge.yml'])
        })
        it('has host',  function () {
            ff_yml.should.have.property('host')
            ff_yml.host.should.equal('0.0.0.0')
        })
        it('has domain',  function () {
            ff_yml.should.have.property('domain')
            ff_yml.domain.should.equal('example.com')
        })
        it('has port', function () {
            ff_yml.should.have.property('port')
        })
        describe('has db', function () {
            it('has db', function () {
                ff_yml.should.have.property('db')
            })
            it('has db.type', function () {
                ff_yml.db.should.have.property('type')
                ff_yml.db.type.should.equal('postgres')
            })
        })
        describe('has driver', function () {
            it('has driver', function () {
                ff_yml.should.have.property('driver')
            })
            it('has driver.type', function () {
                ff_yml.driver.should.have.property('type')
                ff_yml.driver.type.should.equal('kubernetes')
            })
        })
        describe('has logging', function () {
            it('has logging', function () {
                ff_yml.should.have.property('logging')
            })
            it('default', function () {
                ff_yml.logging.should.have.property('level')
                ff_yml.logging.level.should.equal('info')
            })
            it('http', function () {
                ff_yml.logging.should.have.property('http')
                ff_yml.logging.http.should.equal('info')
            })
        })
        describe('has broker', function () {
            let mosquitto_conf
            before( function () {
                const brokerCM = configMaps.filter(cm => cm.metadata.name === 'flowforge-broker-config')[0]
                mosquitto_conf = brokerCM.data['mosquitto.conf']
            })
            it('has broker', function () {
                ff_yml.should.have.property('broker')
            })
            it('has broker.url', function () {
                ff_yml.broker.should.have.property('url')
                ff_yml.broker.url.should.equal('mqtt://flowforge-broker.default:1883')
            })
            it('has broker.public_url', function () {
                ff_yml.broker.should.have.property('public_url')
                ff_yml.broker['public_url'].should.equal('wss://mqtt.example.com')
            })
            it('has mosquitto.conf', function () {
                // need to check values
            })
            it('has service', function () {
                const service = services.filter( s => s.metadata.name === 'flowforge-broker')
                service.should.have.length(1)
            })
            it('has ingress', function () {
                const ingress = ingresses.filter( s => s.metadata.name === 'flowforge-broker')
                ingress.should.have.length(1)
            })
        })
        describe('has email', function () {
            it('has email', function () {
                ff_yml.should.have.property('email')
            })
        })
        describe('has fileStore', function () {
            it('has fileStore', function () {
                ff_yml.should.have.property('fileStore')
            })
            it('has fileStore.url', function () {
                ff_yml.fileStore.should.have.property('url')
                ff_yml.fileStore.url.should.equal('http://flowforge-file.default')
            })
            it('has service', function () {
                const service = services.filter( s => s.metadata.name === 'flowforge-file')
                service.should.have.length(1)
            })
            it('has configmap', function () {
                const cm = configMaps.filter( s => s.metadata.name === 'flowforge-file-config')
                cm.should.have.length(1)
            })
        })
        describe('has broker', function () {
            it('has broker', function () {
                ff_yml.should.have.property('broker')
            })
            it('has service', function () {
                const service = services.filter( s => s.metadata.name === 'flowforge-broker')
                service.should.have.length(1)
            })
            it('has configmap', function () {
                const cm = configMaps.filter( s => s.metadata.name === 'flowforge-broker-config')
                cm.should.have.length(1)
                const cmp = configMaps.filter( s => s.metadata.name === 'flowforge-broker-ping')
                cmp.should.have.length(1)
            })
        })
    })

})