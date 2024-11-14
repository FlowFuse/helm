#### 2.19.0: Release


#### 2.18.6: Release

 - fix: secret reference indentation in EMQX definition (#497) @ppawlowski

#### 2.18.5: Release

 - fix: emqx secret key name typo (#496) @ppawlowski

#### 2.18.4: Release


#### 2.18.3: Release


#### 2.18.2: Release

 - fix: EMQX service templates (#489) @ppawlowski

#### 2.18.1: Release

 - fix: Change the way of handling EMQX secrets object (#488) @ppawlowski

#### 2.18.0: Release

 - feat: Add possibility to apply `priorityClassName` to all deployments (#485) @ppawlowski

#### 2.17.0: Release

 - feat: Release 2.10.0 (#483) @knolleary

#### 2.16.0: Release

 - feat: Team broker flag (#482) @hardillb
 - chore: Update for new Node-RED releases (#478) @knolleary
 - chore: Bump Node-RED container to 4.0.4 (#477) @knolleary

#### 2.15.0: Release

 - feat: Release 2.9.0 (#470) @cstns
 - ci: temporarily disable container scan with Trivy (#468) @ppawlowski
 - chore: bump Node-RED containers (#467) @hardillb
 - ci: Bump containers reusable workflow version to `v0.29.0` (#459) @ppawlowski

#### 2.14.0: Release

 - feat: add possibility to configure tolerations (#464) @ppawlowski
 - fix: relicense helm chart to Apache-2.0 (#461) @hardillb
 - fix: Update README.md (#458) @hardillb
 - ci: Revert `merge_multiarch_images` workflow version bump (#457) @ppawlowski
 - chore(deps): bump flowfuse/github-actions-workflows from 0.14.0 to 0.28.0 (#454) @app/dependabot
 - chore(deps): bump docker/build-push-action from 6.0.0 to 6.7.0 (#452) @app/dependabot
 - chore(deps): bump flowfuse/github-actions-workflows from 0.10.0 to 0.28.0 (#408) @app/dependabot

#### 2.13.0: Release

 - feat: Release 2.8.0 (#453) @Steve-Mcl
 - fix: Ensure default private ca cert cm name (#451) @hardillb
 - docs: Add release versioning documentation (#448) @ppawlowski
 - fix: Add Email debug (#447) @hardillb

#### 2.12.1: Release

 - fix: Set prometheus scrape port for `flowforge-file` to `3001` (#446) @ppawlowski

#### 2.12.0: Release

 - feat: Add possibility to configure Prometheus endpoint for FileStore app (#445) @ppawlowski

#### 2.11.0: Release

 - feat: Release 2.7.0 (#444) @cstns
 - feat: Allow Session limits to be set (#443) @hardillb
 - feat: Allow SES SourceARN to be set (#438) @hardillb
 - chore(deps): bump tibdex/github-app-token from 1 to 2 (#423) @app/dependabot
 - chore(deps): bump actions/setup-python from 5.1.0 to 5.1.1 (#440) @app/dependabot
 - docs: align changelog entries for `2.10.1` release (#437) @ppawlowski

#### 2.10.1: Release

 - fix: Add `VERSIONING.md` to helm ignored files (#436) @ppawlowski
 - chore: rebrand working directory (#434) @hardillb
 - ci: Build amd64 images only for FFC (#435) @ppawlowski
 - ci: Push updated CHANGELOG.md (#432) @ppawlowski
 - chore: Bump for 2.6.1 (#433) @hardillb
 - ci: Generate main changelog after Helm chart release (#431) @ppawlowski
 - chore: Update the main changlog for `2.10.0` release (#430) @ppawlowski

#### 2.10.0: Release

 - feat: 2.6.0 application release (#429) @cstns

#### 2.9.0: Release

 - fix: avoid parallel images update (#419) @ppawlowski
 - feat: Add helm config for PersistentStorge (#427) @hardillb
 - feat: introduce nr-assistant configuration (#426) @ppawlowski
 - feat: Update ClusterRoll and add /data/storage dir (#407) @hardillb

#### 2.8.0: Release

 - fix: indentation within custom hostname configuration (#413) @ppawlowski
 - feat: Add possibility to collect MQTT broker metrics (#412) @ppawlowski

#### 2.7.0: Release

 - fix: Add cnameTarget @hardillb
 - feat: Custom Hostname config @hardillb

#### 2.6.0: Release

 - ci: Fix CHANGELOG.md path in .releaserc (#385) @Piwero
 - ci: Bump workflow versions to v0.10.0 (#383) @ppawlowski
 - ci: Narrow down container build triggers (#384) @ppawlowski
 - fix: Skip CKV_K8S_10 and CKV_K8S_12 checks (#382) @ppawlowski
 - fix: Skip CKV_K8S_11 and CKV_K8S_13 checks (#380) @ppawlowski
 - fix: Add temporary annotation to skip CKV_K8S_35 check (#381) @ppawlowski
 - fix: Temporarily skip CKV_K8S_35 for forge and file-server deployments (#379) @ppawlowski
 - fix: Disable automounting of service account tokens (#375) @ppawlowski
 - ci: Exclude advanced Helm chart validation on release (#377) @ppawlowski
 - ci: Wait for container images build pipeline before running Helm chart release flow (#376) @ppawlowski
 - feat: Disable `allowPrivilegeEscalation` for init containers (#368) @ppawlowski
 - ci: Enable dependabot for GitHub Actions (#369) @ppawlowski
 - fix: role binding references (#367) @ppawlowski
 - fix: Bind resources to the namespace (#365) @ppawlowski
 - ci: Update checkov-action to use v12 version (#364) @ppawlowski
 - chore: Update 3.1.x container to use NR 3.1.9 (#363) @hardillb
 - feat: Allow number of forge app replicas to be set (#357) @hardillb

#### 2.5.0: Release

 - feat: Add possibility to customize domain for MQTT broker (#359) @ppawlowski

#### 2.4.1: Release

 - chore: Bump for 2.4.2 release (#361) @hardillb
 - fix: Ensure ssl-certs dir exists (#360) @hardillb
 - chore: Update Dockerfile-3.1 for NR 3.1.8 (#358) @knolleary

#### 2.4.0: Release

 - fix: Only build NR 4.0 for amd64 and arm64 (#354) @hardillb
 - feat: upgrade to FlowFuse 2.2.1 (#353) @hardillb
 - ci: Add Node-RED 4.0 public container build job into existing workflow (#352) @ppawlowski
 - ci: Introduce Node-RED `4.0.0-beta` container images (#351) @ppawlowski

#### 2.3.0: Release

 - chore: Update Dockerfile-3.1 to pull 3.1.7 (#348) @knolleary

#### 2.2.0: Release

 - feat: Add imagePullPolicy to initContainers (#342) @ppawlowski
 - fix: Remove helm annotation hooks from `upgrade-db` job (#344) @ppawlowski
 - ci: Enable manual release of container images (#341) @ppawlowski
 - feat: Openshift container changes (#340) @hardillb
 - feat: All containers should use read-only file system (#339) @ppawlowski
 - ci: Allow to manually trigger Helm chart release pipeline (#338) @ppawlowski
 - ci: Validate Helm chart against full stack deployment (#337) @ppawlowski
 - fix: db-upgrade job image URL (#336) @ppawlowski
 - Update to NR 3.1.6 (#335) @hardillb
 - feat: Drop all forge container capabilities (#334) @ppawlowski
 - fix: Use file-server container for db upgrade job (#307) @hardillb
 - feat: Add possibility to create custom Network Policies for project pods (#331) @ppawlowski
 - fix: Drop all capabilities for init container (#333) @ppawlowski

#### 2.1.1: Release

 - ci: Wait for forge app public image to become available (#329) @ppawlowski
 - ci: Update containers build/deploy reusable workflows to `v0.5.1` (#328) @ppawlowski
 - ci: Bump workflows to `v0.5.0` (#327) @ppawlowski
 - ci: Test helm chart upgrade process against version in `main` branch (#325) @ppawlowski
 - feat: Add possibility to configure unique annotations for each ingress object (#324) @ppawlowski
 - fix: Removal of redundant service used for communication with database (#323) @ppawlowski
 - fix: Keep e-mail password in secret object (#321) @ppawlowski
 - refactor: Container rename 2 (#274) @hardillb
 
#### 2.1.0: Release

 - fix: Update liveness and readiness probe timeout values for broker pod (#316) @ppawlowski
 - feat: Allow FileStore image to be set (#314) @hardillb
 - feat: Add default container security context values for broker container (#313) @ppawlowski
 - fix: Rollback selector labels for existing deployments (#312) @ppawlowski
 - feat: Allow to run local postgresql database on ARM nodes (#310) @ppawlowski
 - feat: Add support for Google Analytics (#311) @hardillb
 - fix: Only run the job if fileStore is enabled (#309) @hardillb
 - fix: improve the description of the forge.registry field (#308) @hardillb
 - fix: Ensure both priave ca certs configmaps have default names (#304) @hardillb
 - ci: Ignore Helm chart related files in images build pipelines (#303) @ppawlowski
 - feat: Add consistent labels to all resources created by the Helm chart (#302) @ppawlowski
 - fix: Fix typo missed in review (#301) @hardillb
 - feat: Add log passthrough support (#300) @hardillb
 - chore: Create helm chart `upgrade` documentation (#292) @ppawlowski
 - feat: Add possibility to provide database credentials as an external secret (#296) @ppawlowski
 - ci: Do not run checkov against subcharts (#297) @ppawlowski
 - ci: Run checkov against helm chart directory instead of templated yaml (#294) @ppawlowski
 - ci: fix helm chart validation pipeline to include subdirectories (#293) @ppawlowski
 - feat: Keep database credentials in kubernetes secrets (#287) @ppawlowski
 - feat: Add possibility to configure probes for each pod (#291) @ppawlowski
 - feat: Add `containerSecurityContext` for each container (#289) @ppawlowski
 - chore: Update actions used to build release containers (#286) @hardillb

#### 2.0.0: Release

 - Bump included versions @hardillb

#### 2.0.0: Release

 - refactor: rename containers (#272) @hardillb
 - feat: Helm chart v2 (#279) @ppawlowski
 - Add support for using cert manager to issue TLS certs (#267) @hardillb
 - chore: Update GitHub Actions workflows to use v0.4.1 (#277) @ppawlowski
 - chore: Bump reusable workflows version to `v0.4.0` (#271) @ppawlowski
 - feat: Deploy to stage from main branch only (#273) @ppawlowski
 - Introduce helm chart automatic release workflow (#269) @ppawlowski

#### 1.15.0: Release

 - Update for new flowfuse npm package (#244) @knolleary
 - FIX: workflows tag version reference (#246) @ppawlowski
 - Enable image scanning for all containers (#245) @ppawlowski

#### 1.14.2: Release

 - Update Node-RED to 3.1.3 (#242) @knolleary
 - Fix 3.1.x tag for docker hub (#241) @hardillb

#### 1.14.1: Release

 - Update NR to 3.1.2 (#239) @knolleary
 - Remove `postgresql.global.storageClass` from default chart values (#231) @ppawlowski
 - Add possibility to customise clusterrole name (#237) @ppawlowski
 - Run 3.1.1 NR on NodeJS 18 (#236) @hardillb
 - Update k8s driver package scope (#235) @knolleary
 - Update file server to new npm scope (#234) @knolleary
 - Use environment-scoped AWS credentials in pipelines (#233) @ppawlowski

#### 1.14.0: Release

 - Update NR containers to pull in @flowfuse/nr-launcher (#230) @knolleary
 - Validate value of `domain` property (#227) @ppawlowski
 - Fix typo in README.md (#222) @ppawlowski

#### 1.13.3: Release

 - Add affinity info to readme (#218) @ppawlowski
 - Add affinity configuration for broker and flowforge deployments (#217) @ppawlowski
 - Add support for setting Content Security Policy (#212) @hardillb
 - FIX: Allow to handle multiline ingress annotations (#215) @ppawlowski
 - Node 18 containers (#213) @hardillb
 - FIX: typo in upload step name (#211) @ppawlowski
 - FIX: typo in environment name in Node-Red container pipeline (#210) @ppawlowski
 - Push Node-RED images to production ECR (#209) @ppawlowski

#### 1.13.2: Release
 
 - Bump to FlowFuse v1.13.2 @hardillb
 - Switch node-red container build to new approach (#200) @ppawlowski

#### 1.13.1: Release

 - Bump to FlowFuse v1.13.1 @hardillb

#### 1.13.0: Release

 - Pin reusable workflows to tag instead of SHA (#201) @ppawlowski

#### 1.12.5: Release

 - Set NODE_ENV (#198) @hardillb
 - Fix Sentry env values (#197) @flecoufle
 
#### 1.12.4: Release

 - Update to FlowFuse v1.12.4
 - Add SENTRY_ENV to deployment (#195) @hardillb
 - Fix annotations location (#194) @ppawlowski
 - Add prometheus-related pod annotations (#193) @ppawlowski

#### 1.12.3: Release

 - Update to FlowFuse v1.12.3
 - config: Add Prometheus config (#191) @ZJvandeWeg
 - Increase broker acl cache to 5mins (#190) @hardillb
 - Add support for configuring sentry telemetry (#188) @Pezmc
 - Enable file server http logging (#189) @hardillb

#### 1.12.2: Release

 - Bump to FlowForge v1.12.2 @hardillb

#### 1.12.1: Release

 - Bump to FlowForge v1.12.1 @hardillb

#### 1.12.0: Release

 - Enable concurrency in deployment pipelines (#182) @ppawlowski
 - Deploy multiarch image from temporary registry (#179) @ppawlowski
 - Only config file-server if needed (#180) @hardillb
 - Build container images using packages from public npm registry (#177) @ppawlowski
 - Pin reusable workflow to commit SHA (#175) @ppawlowski

#### 1.11.0: Release

 - Disable production containers build (#167) @ppawlowski
 - Add possibility to deploy flowforge container to stage environment (#165) @ppawlowski
 - Introduce dedicated containers images build pipeline (#163) @ppawlowski

#### 1.10.0: Release

 - Revert create-pod Role name (#159) @hardillb
 - Allow variable substituion in Ingress Annotations (#156) @hardillb
 - Add Rate Limit details (#158) @hardillb
 - FlowForge helm: 1. Editors: service account. 2. Broker: propagate ingress. 3. README (#148) @elenaviter
 - Allow DB connection to use SSL (#154) @hardillb

#### 1.9.0: Release

 - Add comment about PostgreSQL constraints (#145) @hardillb
 - Remove device-agent container build (#139) @hardillb

#### 1.8.0: Release

 - Update README.md (#137) @hardillb
 - Update Dockerfile-3.1 (#136) @hardillb
 - Update Dockerfile-3.1 (#134) @hardillb
 - Add permission to list endpoints (#133) @hardillb

#### 1.7.0: Release

 - Editor ingress settings (#126) @elenaviter
 - Ingress settings for Flowforge in K8s (#125) @andreikop

#### 1.6.0: Release

 - Fix Release.Name in job-upgrade-db (#122) @flecoufle
 - Add deviceCost to configmap (#124) @hardillb
 - Add HOME env var (#123) @hardillb

#### 1.5.0: Release

 - Add NR 3.1.0 build (#120) @hardillb
 - Add support to supply Private ca certificate bundle (#117) @hardillb
 - Allow empty SMTP user/pass (#116) @hardillb

#### 1.4.0: Release

 - Remove hard coded ingress annotations for AWS (#113) @hardillb
 - Add eslint for test files (#111) @knolleary
 - Add device product/price to config map (#110) @knolleary
 - Fix line break in telemetry (#109) @hardillb
 - Add posthog apihost to config (#107) @hardillb
 - Fix missing `s` in default context host (#105) @hardillb
 - Add more tests (#103) @hardillb
 - First pass at basic tests for Helm Chart (#90) @hardillb
 - Wait for containers to build before publish helm (#101) @hardillb
 - Fix Go Template formating for frontend telemetry (#102) @hardillb

#### 1.3.0: Release

 - Add branding inserts (#99) @hardillb
 - Add support for Free trial configuration (#96) @hardillb
 - Bump 2.2.3 container to NodeJS 16 base (#97) @hardillb
 - Add support for HubSpot support agent (#95) @hardillb
 - Add deployment permissions (#93) @hardillb
 - Allow upgrade DB script to run without failing (#92) @hardillb
 - Fix configmap (#89) @flecoufle
 - Fix gha (#86) @hardillb
 - Fix helm chart publish (#85) @hardillb

#### 1.2.0: Release

 - Add context store provisioning (#79) @hardillb
 - Add enabled flags for broker and file-server (#73) @hardillb
 - Expose the port so it can be used for HTTP-in/out (#82) @hardillb
 - No need to symlink python3 anymore (#81) @hardillb
 - Docker: Publish images for the device agent (#80) @ZJvandeWeg
 - Publish helm (#78) @hardillb

#### 1.1.0: Release

 - Fix indentation in file-server.yml (#67) @hardillb
 - Rename file-storage package (#66) @hardillb
 - Add File Server (#64) @hardillb
 - Update helm chart readme about node selectors (#65) @hardillb
 - Typo in docs for ProjectSelector (#63) @hardillb
 - Fix path to README (#62) @hardillb

#### 1.0.1: Release

 - Update for FlowForge 1.0.1
 
#### 1.0.0: Release

 - Remove flowforge nodes from /data/package.json (#56) @hardillb
 - Push README.md files to Docker Hub with each release (#54) @hardillb
 - Limiting the containers capabilities (#53) @hardillb
 - Allow EE license to be added to configmap from helm chart (#45) @hardillb

#### 0.10.0: Release

 - Fix case on npm authToken (#46) @hardillb
 - Use GH token to auth if using custom repo (#44) @hardillb
 - Move to docker GH actions (#43) @hardillb

#### 0.9.0: Release

- containers: Publish containers publicly each release @ZJvandeWeg
 - Add option to overide forge app container image (#39) @hardillb
 - Set correct default broker url (#38) @hardillb
 - Add team types (#37) @hardillb
 - Add support for PostHog metrics (#36) @hardillb
 - Versioning (#34) @hardillb
 - Add Health Check URL for MQTT broker (#35) @hardillb
#### 0.8.0: Release

 - Bump version for 0.8.0 (#32) @hardillb
 - Update auth http paths (#31) @hardillb
 - Add plausible config (#30) @hardillb
 - add dep @flowforge/nr-project-nodes (#29) @Steve-Mcl
 - Start of adding the broker (#26) @hardillb
 - Add FF Theme to node-red container (#25) @hardillb

#### 0.7.0: Release

 - Fix missing Python2 for sqlite3 (#23) @hardillb

#### 0.6.0: Release


#### 0.5.0: Release

#### 0.4.0: Release

 - Update project automation (#17) @knolleary
 - Fix version of NR available to Launcher (#16) @hardillb
 - Add billing template to helm config (#15) @hardillb
 - Update README.md (#14) @hardillb
 - Allow Project Node selector to be set (#13) @hardillb
 - Only apply ALB annotation on AWS (#12) @hardillb

#### 0.3.0: Release

 - Fix when not running on AWS (#10) @hardillb
 - Add to node-red container as well (#9) @hardillb
 - Add option to specify npm registry (#8) @hardillb

#### 0.2.0: Release

 - Add default host config to 0.0.0.0 (#7) @hardillb
 - First AWS EKS deployment (#5) @hardillb
 - Add more email config (#4) @hardillb
 - Add ALB annotations (#3) @hardillb
 - Add project workflow automation (#2) @knolleary
 - Make installing Postgres optional (#1) @hardillb

 
