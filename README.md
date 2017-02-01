# Performance Horizon API Docs

[![Build Status](https://travis-ci.org/PerformanceHorizonGroup/apidocs.svg?branch=master)](https://travis-ci.org/PerformanceHorizonGroup/apidocs)

The PH api documentation is written in [api blueprint](https://apiblueprint.org/).

Read and interact with our docs at [apiary.io](http://docs.performancehorizon.apiary.io/).

We test our docs with [dredd](http://dredd.readthedocs.io/en/latest/).

We would welcome all contributions to our docs, to get involved, follow the setup
instructions below and hit us with a pull request.

## Local Install (MacOS)

### Dependencies 

* Ruby 1.8 +
* Brew

### Instructions

**1** - Clone this repository

**2** - Install Node.js, NPM and NVM globally by running:

```bash
brew install node npm nvm
```

**3**  - Install the apiaryio Ruby Gem globally:
```
# With RVM or rbenv
gem install apiaryio

# Without RVM or rbenv
sudo gem install apiaryio
```

**4** . Install the Node.js modules. Run the below in the directory that this repository was cloned into:
```
npm install
```

### Preview
You can preview the docs locally, this will open up your default browser and
render the docs. Please give the docs time to render, they require external assets.

```
make
apiary preview --path="apiary.apib"
````

### Contributing

#### Edits
Any edits to existing endpoints should be made within the relevant file(s) and submitted via Pull Requests.

#### New Endpoints
We use transclusion to ensure the `.apib` files are easily readable and maintainable. If you are 
documenting a new endpoint, you should:
 
* Create a new file named after the endpoint in `/src` which contains all the endpoint information
* For any new Data Structures directly related to the new endpoint, document these in a new file in `/data`
* If you refactor commonly used, simple entities (referenced by multiple endpoints) into a Data Structure,
reference these in `/data/common.apib`
* To include your new files into the master document, modify `/src/apiary.apib` to flag them for hercule
* Submit a Pull Request
