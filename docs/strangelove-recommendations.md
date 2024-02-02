![Burnt banner](https://files.xion-testnet-1.burnt.com/banner.jpg)
![Strangelove banner](https://files.xion-testnet-1.burnt.com/strangelove.png)

# "So You Want To Launch A Mainnet?"

## Authors
- [Burnt Labs](https://burnt.com)
- [Strangelove Ventures](https://strange.love)


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
   - 🍊 [ ] Ensure the testnet has running smoothly for some time.
   - 🍊 [ ] Ensure the testnet has been upgraded at least once.
   - 🍊 [ ] Ensure the testnet has been attacked at least once.
   - 🍊 [ ] Ensure the testnet has been crashed at least once.
   - 🍊 [ ] The lessons learned on testnet will help you (maybe?) avoid crashing mainnet.

1. 🍏 Unit and Integration testing
   - 🍊 [ ] Ship the $MAINNET binary. It's fully-tested, right?
   - 🍊 [ ] Write [interchaintest](https://github.com/strangelove-ventures/interchaintest) unit / integration tests for your network.
   - 🍊 [ ] Run the interchaintest in CI. It's passing, right?

2. 🍏 Network Reference Documentation
   - 🍊 [ ] Create a `networks` Repository (this repo)
   - 🍊 [ ] Ensure all configuration about the network is available.
   - 🍊 [ ] Build some tooling to lower the cognitive load on launch day.

3. 🩶 Communicate with your Validators early and often
   - 🩶 [ ] Define and document the criteria for validator participation.
   - 🩶 [ ] Communicate these criteria clearly to potential validators.
   - 🩶 [ ] Choose wisely. The network is only as secure as its laziest validators.
   - 🩶 [ ] Define the initial stake with your Validator partnerships.

4. 🍊 Run some Dress Rehearsals internally
   - 🍊 [ ] Ensure anyone who's interested knows how to run a node.
   - 🍊 [ ] Ensure everyone knows how to monitor the network.

4. 🍏 Build out a tentative Genesis file
  - 🍊 [ ] Export the config of your strongest surviving testnet
  - 🍊 [ ] Create a `genesis.json` file from the testnet's state, resetting all counters to zero.
  - 🍊 [ ] Practice collecting gentx's from team members.
  - 🍊 [ ] Build the final `genesis.json` by running `collect-gentx`.
  - 🍊 [ ] Ensure the `genesis.json` is valid and can be validated by a third party.


II. Onboard the Validators
---------------------------------

1. Genesis Transaction Submission

- 🍊 [ ] create GH action to mount repo, run `collectGentx`, fail PRs that aren't right
- 🍊 [ ] structure repos so that you can run `collectGentx` (from the binary) on each PR to ensure that only valid gentx's are getting merged
- 🩶 [ ] Instruct each validator to submit a Pull Request (PR) to the repository with their `MsgCreateValidator` transaction.
- 🍊 [ ] Ensure each PR includes a memo with a valid p2p ID for block 1.
- NB: many legit val's `gentx`'s weren't valid bc e.g. they signed, changed moniker, and resubmitted (w/ a sig that no longer passed validation)

2. PR Review and Verification

- 🩶 Anticipate unauthorized vals submitting gentx.
- 🩶 Confirm validator identity through a trusted communication channel before accepting their PR.

III. Configure & Distribute the Genesis File
---------------------------------

1. Testing Genesis file

- 🍊 [ ] Create a temporary genesis file.
- 🍊 [ ] Retain only one validator that you control, update the start time, and test chain start and indexing.

2. Finalize Genesis File

- 🍊 [ ] Spin up a network which spoofs all validators to see if anything breaks.
- 🍊 [ ] Once testing is successful, publish the final `genesis.json`.
- 🩶 [ ] Distribute this file to all validators. Avoid changes unless absolutely necessary.
- 🍊 [ ] put hash of genesis file into repo
- 🩶 [ ] get outside verification that it's right (foreign verifiers should get same SHA256 that we get)

- 🍊 interchaintest is helpful for this stuff 👆, esp w/ upgrades

3. Spin up seed nodes
  - 🍊 [ ] spin them up
  - 🩶 [ ] ask some vals to spin up non-validator nodes too
  - 🫐 [ ] create a Persistant Peers (& Seeds) manifest. Validators can add to this list via gDoc or some other controlled thing. Ship it close to wartime.
  - 🩶 [ ] create a War Room (discord, TG, etc.) where this is coordinated.

  - 🍊 Important for Seed Nodes:
    - official team should run a node
    - TenderSeed is a nice piece of kit
      - always listening, can validate healthy endpoints

🍏 NB: Allow a minimum of 3 days for validators to prepare their infrastructure based on the genesis file.
  - Vals are busy and you're likely not their #1 priority
  - they may do setup in advance
  - late-breaking `genesis.json` changes may not reach some folks
  - if you DO have to change, be noisy about it
  - make it easy for them to succeed


IV. Communication and Support
---------------------------------

1. Configure Discord

- 🩶 [ ] Set up dedicated channels for validator chat and announcements.
- 🫐 [ ] Ensure appropriate user roles for access and participation.

- are there any good bots worth looking into?
  - enigma has some cool monitoring
  - recruit some bigger vals and they'll have good bots
  - activenodes

2. Create Announcement Strategy
- 🫐 [ ] draft internal comms plan / ticktock
  - is there a shared surface for ticktock?
  - Dress Rehersal?
- Coordinate announcements in both Discord and the networks repository.
- Clearly communicate key dates and updates.
  - don't forget to accomodate for timezones (e.g. use auto-timezone-formatting tools in discord; share the UTC timestamp which renders as local time)

V. Documentation and Support Materials
---------------------------------

1. Validator Documentation
  - 🫐 [ ] ship documentation
    - 🔥 it's up at docs.burnt.com
  - Ensure MAINNET validator documentation is clear and accessible.
  - Include essential information like binary name, version, minimum gas price, chain ID, seeds, peers, and genesis file location.
  - Highlight any non-standard requirements (e.g., BLS information).

VI. Additional Considerations
---------------------------------

1. Marketing and Outreach

- 🫐 Develop a marketing strategy to promote the network launch.
- 🫐 Engage with the community through social media, webinars, and other platforms.

2. Technical Readiness

- 🍊 [ ] Conduct thorough stress tests and simulations to ensure network resilience. // more detail?
- 🍊 [ ] Set up monitoring and alerting systems for early detection of issues. // examples?
  - 🔥 using prometheus (nodeExporter, blackbox, open-source dashboards) and coswatch

3. Post-Launch Support

- 🍊 [ ] Establish a rapid response team for handling post-launch issues.
  - who's on it?
  - when are they on-call?
  - 🍊 [ ] agree on the "oh shit" incident response protocol
    - new slack channel per incident? who's attending to public-facing comms? monitoring? etc
  - does the team need a {private, public-facing} SLA to coordinate expectations?
- 🩶 [ ] Create/maintain open channels for feedback and continuous improvement.
  - distinct from `EMERGENCY WAR ROOM OMG OMG` incident response channel
- 🍊🩶 [ ] ensure there's a way ppl can reach you privately. sometimes incident feedback needs to be non-public

4. Governance and Compliance

- [ ] Engage with legal advisors to ensure regulatory adherence.
- 🫐 [ ] Clearly define governance protocols and compliance measures.

VII. Timeline and Milestones
---------------------------------

- 🍊🫐🩶 [ ] Create a detailed timeline with specific milestones.
- 🍏 Don't forget to include buffer periods for unforeseen delays or issues.

VIII. Feedback and Iteration
---------------------------------

- 🩶 [ ] instrument a way to regularly solicit feedback from validators
- 🫐 [ ] instrument a way to regularly solicit feedback from community members
- 🍊 [ ] ensure feedback finds its way to the backlog (e.g., schedule regular feedback review)

---

## Q&A

### Most common fire-drills?
- Chain upgrades scare me. Use interchaintest to go from genesis to the version you're trying to upgrade. Noble has a good example. Test rolling upgrades, test on-chain, off-chain. Test it all.
  - Q: where should the tests live? Network repo?
  - A: Nah, app repo. We used a mock-genesis for that test. Ensure nothing is consensus-breaking bw upgrades.
  - A: "it's not gonna be consensus-breaking" is a dangerous assumption. It's better to default to a full software upgrade.
  - A: the upgrade can look successful, but it can lurk there until the non-detirministic tx comes through. That's why the full upgrade is safer.


---


This plan aims to cover all crucial aspects of a successful blockchain network launch, balancing technical precision with effective communication and community engagement.


---

<!-- ## Links -->

[StrangeLove-Ventures/Noble-Networks]: https://github.com/strangelove-ventures/noble-networks
[Cosmos Mainnet Repo]: https://github.com/cosmos/mainnet
[OSMO Networks]: https://github.com/osmosis-labs/networks
[interchaintest]: https://github.com/strangelove-ventures/interchaintest
