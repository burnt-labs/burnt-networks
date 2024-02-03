![Burnt banner](https://files.xion-testnet-1.burnt.com/banner.jpg)
![Strangelove banner](https://files.xion-testnet-1.burnt.com/strangelove.png)

# "So You Want To Launch A Mainnet?"

## Authors
- [Burnt Labs](https://burnt.com)
- [Strangelove Ventures](https://strange.love)


## Synopsis

This plan aims to cover all crucial aspects of a successful blockchain network launch, balancing technical precision with effective communication and community engagement.


O. Meta
---------------------------------

### Key
- 🍏 Timing issues
- 🫐 [Public-facing] Communications
- 🍊 Engineering
- 🩶 Partnerships


I. The Road to Mainnet
---------------------------------

0. 🍏 Testnet is running
   - 🍊 [ ] Ensure the testnet has been running smoothly for some time.
   - 🍊 [ ] Ensure the testnet has been upgraded at least once, preferably several times.
   - 🍊 [ ] Ensure the testnet has been attacked at least once, hopefully by a friendly party.
   - 🍊 [ ] Ensure the testnet has been crashed at least once, whether intentionally or not.
   - 🍊 [ ] The lessons learned on testnet will help you (maybe?) mitigate a bad time on mainnet.

1. 🍊 Unit and Integration testing
   - 🍊 [ ] Ship the $MAINNET binary. It's fully-tested, right?
   - 🍊 [ ] Write [interchaintest](https://github.com/strangelove-ventures/interchaintest) unit / integration tests for your network.
   - 🍊 [ ] Run the interchaintest in CI. It's passing, right?
   - 🍊 [ ] Avoid shipping features just before mainnet launch. It's a bad time to introduce new bugs.

2. 🍊 Network Reference Documentation
   - 🍊 [ ] Create a `networks` repository (this repo)
   - 🍊 [ ] Ensure all configuration about the network is readily available.
   - 🍊 [ ] Build some tooling to lower the cognitive load on launch day.

3. 🫐 Protocol documentation
   - 🔥 [ ] Example: https://docs.burnt.com
   - 🫐 [ ] Ship protocol documentation
   - 🫐 [ ] Ship network documentation
   - 🫐 [ ] Ship onboarding documentation
   - 🫐 [ ] Ensure to highlight any nonstandard requirements (e.g., BLS information).
   - 🫐 [ ] Update documentation as the network evolves.

4. 🩶 Communicate with your Validators early and often
   - 🩶 [ ] Set up dedicated channels for validator chat and announcements.
   - 🩶 [ ] Define and document the criteria for validator participation.
   - 🩶 [ ] Communicate these criteria clearly to potential validators.
   - 🩶 [ ] Choose wisely. The network security is commensurate with validator quality.
   - 🩶 [ ] Define the initial stake with your Validator partnerships.
   - 🩶 [ ] Establish well known communication channels; Discord, Telegram, etc.
   - 🩶 [ ] We recommended keeping internal team comms on a separate medium from external comms.

5. 🍊 Build out a tentative Genesis file
   - 🍊 [ ] Export the config of your strongest surviving testnet
   - 🍊 [ ] Create a `genesis.json` file from the testnet's state, resetting all counters to zero.
   - 🍊 [ ] Practice collecting gentx's from team members.
   - 🍊 [ ] Build a valid `genesis.json` by running `collect-gentx`.
   - 🍊 [ ] Ensure the `genesis.json` is valid and can be validated by a third party.
   - 🍊 [ ] Automate the `collect-gentx` process and run it in CI.
   - 🍊 [ ] Automate the genesis validation and run it in CI.


II. Onboard the Validators
---------------------------------

1. 🍏 Genesis Transaction Submission
   - 🍊 [ ] Create a `gentx` directory in the `networks` repository.
   - 🩶 [ ] Agree on a process for submitting `gentx`'s, such that you are sure submissions come from the right people.
   - 🩶 [ ] Anticipate unauthorized validators trying to sneak into the genesis block.
   - 🍊 [ ] Require that all commits to the `networks` repo are `Verified`.
   - 🍊 [ ] Adapt the previous automation of `collect-gentx`, adding checks for Validator authenticity.
   - 🩶 [ ] Sync with each validator and have them commit their `MsgCreateValidator` transaction to the `gentx` directory.
   - 🍊 [ ] Ensure each PR includes a `memo` with a valid p2p ID for block 1.
   - 🩶 [ ] Ensure all parties know that once submitted, a `gentx` MUST NOT change. 
     - Its signature will be different, and the network will reject it.
   - 🍊 [ ] Build a candidate `genesis.json` once all expected `gentx` have been submitted.


III. Configure & Distribute the Genesis File
---------------------------------

1. 🍊 Testing Genesis file
   - 🍊 [ ] Upate your candidate `genesis.json` and retain only one validator under your control.
   - 🍊 [ ] Update the start time, and test chain start and indexing.

2. 🍏 Finalize Genesis File
   - 🍊 [ ] Spin up a network which spoofs all validators to see if anything breaks.
   - 🍊 [ ] Once testing is successful, publish the final `genesis.json` (in this repo).
   - 🩶 [ ] Distribute this file to all validators. **Avoid changes unless absolutely necessary**; think panic on boot.
   - 🍊 [ ] Add multiple checksum hashes of the genesis file into the `networks` repo.
   - 🍊 [ ] Provide instructions on how to verify the genesis file using the hashes.
   - 🩶 [ ] Obtain third-party confirmation that the verification of the genesis hash is successful.


IV. Dress Rehearsal rundown
---------------------------------

1. 🍊 Begin by running dress rehearsals internally with your team.
   - 🍊 [ ] Ensure anyone who's interested knows how to run a node.
   - 🍊 [ ] Bully the folks who aren't interested into submission.
   - 🍊 [ ] Ensure everyone knows how to monitor the network.
   - 🍊 [ ] Help everyone understand the node operator game.

2. 🍏 Incrementally add Validators to your rehearsals.
   - 🩶 [ ] Not everyone will be able to participate, people are busy. That's okay.

3. 🍊 Boot the Network
   - 🍊 [ ] Spin up the internal Validator nodes.
   - 🍊 [ ] Ensure the internal Validators are producing blocks.
   - 🍊 [ ] Ensure the internal Validators are unreachable on the public internet.
   - 🍊 [ ] Spin up the public-facing Sentry nodes.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are reachable on the public internet.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are syncing the chain.
   - 🍊 [ ] Sping up public-facing Seed nodes.
   - 🍊 [ ] Ensure the public-facing Seed nodes are reachable on the public internet.
   - 🍊 [ ] Ensure the public-facing Seed nodes are syncing the chain.
   - 🍊 [ ] Spin up the RPC node.
   - 🍊 [ ] Ensure the RPC node is reachable on the public internet.
   - 🍊 [ ] Ensure the RPC node is syncing the chain.
   - 🍊 [ ] Enure the RPC node is serving requests.
   - 🫐 [ ] Publish the endpoints to the `networks` repository (this repo).
   - 🫐 [ ] Publish the network information to your ofiicial documentation.
   - 🩶 [ ] Communicate with the Validators and ensure they are able to connect to the network.
   - 🩶 [ ] Ensure the external Validators are producing blocks.
   - 🩶 [ ] Ensure any external fullnodes are syncing the chain.
   - 🍊 [ ] Spin up the monitoring and alerting systems.
   - 🍊 [ ] Spin up the Block Explorer.

4. 🍊 Test the Network
   - 🍊 [ ] Test the network with a variety of transactions.
   - 🍊 [ ] Test the network with a variety of queries.
   - 🍊 [ ] Test the network with a variety of attacks.
   - 🍊 [ ] Test the network with a variety of upgrades.
   - 🍊 [ ] Test the network with a variety of failures.
   - 🍊 [ ] Ensure monitoring and alerting coverage is sufficient.

5. 🍊 Nuke the Network
   - 🍊 [ ] Tear-down the Sentry nodes.
   - 🍊 [ ] Tear-down the RPC node.
   - 🍊 [ ] Tear-down the Seed node.
   - 🍊 [ ] Tear-down the internal Validators.
   - 🩶 [ ] Tear-down the external Validators.
   - 🩶 [ ] Tear-down any external fullnodes.
   - 🍊 [ ] Tear-down the monitoring and alerting systems.
   - 🍊 [ ] Tear-down the Block Explorer.
   - 🍊 [ ] Ensure the network is dead.

6. 🍊 Automate every single step of this process
    - 🍊 [ ] Think big-green button to launch
    - 🍊 [ ] Think big-red button to nuke
    - 🍊 [ ] Come launch day, you'll be glad you did.


V. Communication and Support
---------------------------------

1. 🩶 Validator Community TLC
   - 🩶 [ ] Allow a minimum of 3 days for validators to prepare their infrastructure based on the genesis file.
   - 🩶 [ ] Ensure that the genesis file is distributed to all validators.
   - 🩶 [ ] If any late-breaking changes are made to the genesis file, ensure that all validators are notified immediately.
   - 🩶 [ ] Be noisy about any changes to the genesis file. 
   - 🩶 [ ] Make it easy for validators to succeed.

2. 🫐 Configure Discord
   - 🫐 [ ] Ensure appropriate user roles for access and participation.
   - 🫐 [ ] Create a dedicated channel for mainnet launch announcements.
   - 🫐 [ ] Automate any Discord drudgery with bots.

3. 🫐 Create Announcement Strategy
   - 🫐 [ ] Draft internal communications for the team.
   - 🫐 [ ] Coordinate announcements in both Discord and the `networks` repository.
   - 🫐 [ ] Clearly communicate key dates and updates.
   - 🍏 Don't forget to accomodate for timezones (e.g. use auto-timezone-formatting tools in discord; share the UTC timestamp which renders as local time)


VI. 🚀 LAUNCH TIME
---------------------------------

1. 🍏 Firm up the Launch Time
   - 🍏 [ ] Ensure all validators are ready to go.

2. 🩶 Confirm everyone has the same `genesis.json`
   - 🩶 [ ] Ensure all validators have the `genesis.json` and are ready to go.

3. 🚀 LAUNCH
   - 🍊 [ ] Your Dress Rehearsal automation will be your best friend here.
   - 🍊 [ ] Spin up the internal Validator nodes.
   - 🍊 [ ] Ensure the internal Validators are producing blocks.
   - 🍊 [ ] Ensure the internal Validators are unreachable on the public internet.
   - 🍊 [ ] Spin up the public-facing Sentry nodes.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are reachable on the public internet.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are syncing the chain.
   - 🍊 [ ] Sping up public-facing Sentry nodes.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are reachable on the public internet.
   - 🍊 [ ] Ensure the public-facing Sentry nodes are syncing the chain.
   - 🍊 [ ] Spin up the RPC node.
   - 🍊 [ ] Ensure the RPC node is reachable on the public internet.
   - 🍊 [ ] Ensure the RPC node is syncing the chain.
   - 🍊 [ ] Enure the RPC node is serving requests.
   - 🫐 [ ] Publish the endpoints to the `network` repository (this repo).
   - 🫐 [ ] Publish the network information to your official documentation.
   - 🩶 [ ] Communicate with the Validators and ensure they are able to connect to the network.
   - 🩶 [ ] Ensure the external Validators are producing blocks.
   - 🩶 [ ] Ensure any external fullnodes are syncing the chain.
   - 🍊 [ ] Spin up the monitoring and alerting systems.
   - 🍊 [ ] Spin up the Block Explorer.


VII. Additional Considerations
---------------------------------

1. 🫐 Marketing and Outreach
   - 🫐 Develop a marketing strategy to promote the network launch.
   - 🫐 Engage with the community through social media, webinars, and other platforms.

2. 🍊🫐 Post-Launch Support
   -  🍊🫐 [ ] Establish a rapid response team for handling post-launch issues.
     - who's on it?
     - when are they on-call?
   - 🍊🫐 [ ] agree on the "oh shit" incident response protocol
     - new slack channel per incident? 
     - who's attending to public-facing comms?
     - does the team need a {private, public-facing} SLA to coordinate expectations?
   - 🫐🩶 [ ] Create/maintain open channels for feedback and continuous improvement.
   - 🍊🩶 [ ] Ensure there's a way ppl can reach you privately. sometimes incident feedback needs to be non-public

3. Governance and Compliance
   - 🫐 [ ] Engage with legal advisors to ensure regulatory adherence.
   - 🫐 [ ] Clearly define governance protocols and compliance measures.


VIII. Feedback and Iteration
---------------------------------

- 🩶 [ ] instrument a way to regularly solicit feedback from validators
- 🫐 [ ] instrument a way to regularly solicit feedback from community members
- 🍊 [ ] ensure feedback finds its way to the backlog (e.g., schedule regular feedback review)
