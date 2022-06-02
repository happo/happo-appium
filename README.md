# Exploring a Happo integration with Appium

This repository has some sample code that demonstrates using Happo with an
Appium test suite.

There's sample code for [JavaScript](test.js) and [Ruby](test.rb).

## Preparation
If you want to try running these tests yourself, you need to do some preparations first: 
1. Clone https://github.com/appium/ios-test-app locally and run `npm install` in the ios-test-app folder after cloning
2. Clone this repo
3. In the happo-appium folder, run `yarn install`
4. Make sure that you have XCode installed
5. Sign up for a Happo trial at https://happo.io/signup
6. Create a file called `.env` with the following content:
```
HAPPO_API_KEY=<apiKey>
HAPPO_API_SECRET=<apiSecret>
```
Where `<apiKey>` and `<apiSecret>` is replaced by tokens found at https://happo.io/account

## JavaScript
To run the JavaScript/NodeJS test, run this command:
```bash
yarn happo-e2e -- -- node test.js
```


## Ruby
First, run `bundle install` to install Ruby dependencies. Then run this command:

```bash
yarn happo-e2e -- -- ruby test.rb
```
