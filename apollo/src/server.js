import { ApolloServer, gql } from 'apollo-server'
import { schema as User, resolvers as userResolvers } from './user'
import { schema as Activity, resolvers as activityResolvers } from './activity'

const RootQuery = gql`
	type Query {
		user: User
		generatedActivities: [GeneratedActivity]
		generatedActivity: Activity
	}

	type Mutation {
		createUser(user: UserInput!): SuccessResponse
	}

	type SuccessResponse {
		success: Boolean
	}

`

const resolvers = {}

const server = new ApolloServer({
	typeDefs: [RootQuery, User, Activity],
	resolvers: [resolvers, userResolvers, activityResolvers]
})

server.listen().then(({ url }) => {
	console.log(`🚀 Server ready at ${url}`)
})
