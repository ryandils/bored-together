import { ApolloServer, gql } from 'apollo-server'

const typeDef = gql`
	type Query {
		user: User
	}

	type User {
		name: String
	}
`

const resolvers = {
	Query: {
		user: () => { return ({ name: 'Jeb' }) }
	}
}

const server = new ApolloServer({
	typeDefs: typeDef,
	resolvers
})

server.listen().then(({ url }) => {
	console.log(`🚀 Server ready at ${url}`)
})

