const assert = require('assert')
const app = require('../app')

describe('App', () => {
  describe('responseBody()', () => {
    it('should contain Hello World', () => {
      assert(app.responseBody().indexOf('Hello World') !== -1)
    })
  })
})
