import { gql } from 'apollo-server'
import casual from 'casual'
import moment from 'moment'
import { boredAPI, bigQueryAPI } from '../datasources'

export const schema = gql`
	type Activity {
		id: ID!
		hostId: ID!
		name: String!
		accessibility: Float
		activityType: String
		participantAmount: Int
		price: Float
		link: String
		key: ID
		location: String
		timestamp: String
		users: [User!]
	}

	type GeneratedActivity {
		name: String
		accessibility: Float
		activityType: String
		participants: Int
		price: Float
		link: String
		key: ID
	}
`

export const resolvers = {
	Query: {
		activity: (_, { id }) => bigQueryAPI.getActivity(id),
		activeActivity: () => bigQueryAPI.getActiveActivities(),
		generatedActivities: () => boredAPI.generateActivities()
	}
}

export const mocks = {
	Activity: () => ({
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
