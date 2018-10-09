const assert = require('assert')
const http = require('http')
const puppeteer = require('puppeteer')

let browser
let page

before(async () => {
  browser = await puppeteer.launch({
    ignoreHTTPSErrors: true,
    args: [
      // Required for Docker version of Puppeteer
      '--no-sandbox',
      '--disable-setuid-sandbox',
      // This will write shared memory files into /tmp instead of /dev/shm,
      // because Docker’s default for /dev/shm is 64MB
      '--disable-dev-shm-usage'
    ]
  })

  const browserVersion = await browser.version()
  console.log(`Started ${browserVersion}`)
})

beforeEach(async () => {
  page = await browser.newPage()
})

afterEach(async () => {
  await page.close()
})

after(async () => {
  await browser.close()
})

describe('App', () => {
  it('renders', async () => {
    const response = await page.goto('http://app:3000/')
    assert(response.ok())
  })
})
