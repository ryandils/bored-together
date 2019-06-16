import { gql } from 'apollo-server'
import casual from 'casual'

export const schema = gql`
	type User {
		id: ID!
		facebookToken: String!
		firstName: String!
		lastName: String!
		dob: String!
		gender: String!
		profilePictureUrl: String
	}
`

casual.define('gender', () => {
	return casual.coin_flip ? 'male' : 'female'
})

export const resolvers = {
	Query: {
		user: () => ({
			id: casual.uuid,
			facebookToken: casual.uuid,
			firstName: casual.first_name,
			lastName: casual.last_name,
			dob: casual.date(),
			gender: casual.gender,
			profilePictureUrl: null
		})
	}
}

