<<<<<<< HEAD
export * from './schema'
=======
const { resolvers } = require('./resolvers')
const { schema } = require('./schema')
const { UserAPI } = require('./UserAPI')

module.exports = {
	resolvers,
	schema,
	UserAPI,
}
>>>>>>> develop
