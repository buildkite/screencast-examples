const responseBody = () => '<h1>Hello World</h1>'

const express = require('express')
const app = express()
const port = process.env.PORT || 3000

app.get('/', (req, res) => res.send(responseBody()))

if (require.main === module) {
  app.listen(port, () => console.log(`App listening on port ${port}`))
}

module.exports = { responseBody }
