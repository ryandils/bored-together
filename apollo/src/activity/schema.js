import { gql } from 'apollo-server'
import casual from 'casual'
import moment from 'moment'

export const schema = gql`
	type Activity {
		id: ID!
		hostId: ID!
		name: String!
		ageGroup: String!
		location: String!
		genders: AllowedGenders!
		timestamp: String!
		users: [User!]
	}

	type AllowedGenders {
		male: Boolean
		female: Boolean
	}
`

casual.define('gendersAllowed', () => {
	let male = casual.coin_flip
	let female = casual.coin_flip
	while (!(male || female)) {
		male = casual.coin_flip
		female = casual.coin_flip
	}
	return {
		male,
		female
	}
})

export const resolvers = {
	Query: {
		activity: () => ({
			id: casual.uuid,
			hostId: casual.uuid,
			name: casual.company_name,
			ageGroup: casual.integer(18, 65),
			location: casual.city,
			genders: casual.gendersAllowed,
			timestamp: moment(),
			users: null
		})
	}
}
