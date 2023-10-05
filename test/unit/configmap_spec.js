const should = require('should') // eslint-disable-line
const setup = require('./setup')
const yaml = require('yaml')

describe('Examine Config Maps', function () {
    let configMaps
    before(async function () {
        const { docs } = await setup()
        configMaps = docs.filter(d => d && d.kind === 'ConfigMap')
    })

    describe('FlowForge.yml', async function () {
        let ffYML
        beforeEach(function () {
            const d = configMaps.filter(doc => doc.metadata.name === 'flowforge-config')[0]
            ffYML = yaml.parse(d.data['flowforge.yml'])
        })
        it('has host', function () {
            ffYML.should.have.property('host')
            ffYML.host.should.equal('0.0.0.0')
        })
        it('has domain', function () {
            ffYML.should.have.property('domain')
            ffYML.domain.should.equal('example.com')
        })
        it('has port', function () {
            ffYML.should.have.property('port')
        })
        describe('has db', function () {
            it('has db', function () {
                ffYML.should.have.property('db')
            })
            it('has db.type', function () {
                ffYML.db.should.have.property('type')
                ffYML.db.type.should.equal('postgres')
            })
        })
        describe('has driver', function () {
            it('has driver', function () {
                ffYML.should.have.property('driver')
            })
            it('has driver.type', function () {
                ffYML.driver.should.have.property('type')
                ffYML.driver.type.should.equal('kubernetes')
            })
        })
        describe('has logging', function () {
            it('has logging', function () {
                ffYML.should.have.property('logging')
            })
            it('default', function () {
                ffYML.logging.should.have.property('level')
                ffYML.logging.level.should.equal('info')
            })
            it('http', function () {
                ffYML.logging.should.have.property('http')
                ffYML.logging.http.should.equal('info')
            })
        })
        describe('has broker', function () {
            // let mosquittoConf
            before(function () {
                // const brokerCM = configMaps.filter(cm => cm.metadata.name === 'flowforge-broker-config')[0]
                // mosquittoConf = brokerCM.data['mosquitto.conf']
            })
            it('has configmap', function () {
                const cm = configMaps.filter(s => s.metadata.name === 'flowforge-broker-config')
                cm.should.have.length(1)
                const cmp = configMaps.filter(s => s.metadata.name === 'flowforge-broker-ping')
                cmp.should.have.length(1)
            })
            it('has broker', function () {
                ffYML.should.have.property('broker')
            })
            it('has broker.url', function () {
                ffYML.broker.should.have.property('url')
                ffYML.broker.url.should.equal('mqtt://flowforge-broker.default:1883')
            })
            it('has broker.public_url', function () {
                ffYML.broker.should.have.property('public_url')
                ffYML.broker.public_url.should.equal('wss://mqtt.example.com')
            })
            it('has mosquitto.conf', function () {
                // need to check values
            })
        })
        describe('has email', function () {
            it('has email', function () {
                ffYML.should.have.property('email')
            })
        })
        describe('has fileStore', function () {
            it('has fileStore', function () {
                ffYML.should.have.property('fileStore')
            })
            it('has fileStore.url', function () {
                ffYML.fileStore.should.have.property('url')
                ffYML.fileStore.url.should.equal('http://flowforge-file.default')
            })
            it('has configmap', function () {
                const cm = configMaps.filter(s => s.metadata.name === 'flowforge-file-config')
                cm.should.have.length(1)
            })
            it('http logging enabled', function () {
                const d = configMaps.filter(s => s.metadata.name === 'flowforge-file-config')[0]
                fsYML = yaml.parse(d.data['flowforge-storage.yml'])
                fsYML.should.have.property('logging')
                fsYML.logging.should.have.property('http')
            })
        })
    })

    describe('customizations.yml', async function () {
        let yml
        beforeEach(function () {
            const d = configMaps.filter(doc => doc.metadata.name === 'flowforge-config')[0]
            yml = yaml.parse(d.data['flowforge.yml'])
        })

        it('has sentry telemetry', function () {
            yml.telemetry.frontend.sentry.should.have.property('production_mode')
            yml.telemetry.frontend.sentry.production_mode.should.equal(false)

            yml.telemetry.frontend.sentry.should.have.property('dsn')
            yml.telemetry.frontend.sentry.dsn.should.equal('https://sentry.io/flowforge/flowforge-frontend')

            yml.telemetry.backend.sentry.should.have.property('dsn')
            yml.telemetry.backend.sentry.dsn.should.equal('https://sentry.io/flowforge/flowforge-backend')
        })

        describe('using Prometheus', function () {
            it('has prometheus enabled', function() {
                yml.telemetry.backend.prometheus.enabled.should.equal(true)
            })   
        })
    })
})
