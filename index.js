const { Client } = require('pg')
const client = new Client({
  port: 3306,
  user: process.env['USER'],
  password: process.env['PASSWORD']
})

client.connect().catch(console.log).then(console.log)

module.exports = async (req, res) => {
  const sqlres = await client.query('SELECT $1::text as message', ['Hello world!'])
  res.end(sqlres.rows[0].message) // Hello world!
}
