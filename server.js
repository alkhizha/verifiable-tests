const express = require('express')
const server = express()
const app = require('./app')
const bodyParser = require('body-parser')

server.get('/', (req, res) => res.redirect('/tasks'))

server.get('/tasks', (req, res) => {
  app.getTaskListHtml()
     .then(html => res.send(html))
     .catch(err => res.status(500).send('Server error: ' + err))
})

server.get('/tasks/:taskName', (req, res) => {
  app.getTaskHtml(req.params.taskName)
     .then(html => res.send(html))
     .catch(err => res.status(500).send('Server error: ' + err))
})

const urlencodedBodyParser = bodyParser.urlencoded({ extended: false })

server.post('/tasks/:taskName', urlencodedBodyParser, (req, res) => {
  if (!req.body) {
    return res.sendStatus(400)
  }
  app.getVerifiedTaskHtml(req.params.taskName, req.body.code)
     .then(answerHtml => res.send(answerHtml))
     .catch(err => res.status(500).send('Server error: ' + err))
})

const host = process.env.VTESTS_HOST || 'localhost'
const port = process.env.VTESTS_PORT || 3000
server.listen(port, host, () => console.log(`Listening on ${host}:${port}`))
