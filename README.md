# Performance Horizon API Docs

The PH api documentation is written in [api blueprint](https://apiblueprint.org/).

We render our docs on [apiary.io](http://docs.performancehorizon.apiary.io/).

We would welcome all contributions to our docs, to get involved, follow the setup
instructions below and hit us with a pull request.

## Local Install (MacOS)

### Dependencies

```
brew install node npm nvm
npm install gem
gem install apiaryio
npm install hercule
```

### Preview
You can preview the docs locally, this will open up your default browser and
render the docs. Please give the docs time to render, they require external assets.

```
make
apiary preview --path="apiary.apib"
````
