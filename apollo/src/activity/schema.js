import { gql } from 'apollo-server'
import casual from 'casual'
import moment from 'moment'
import { boredAPI } from '../datasources'

export const schema = gql`
	type Activity {
		id: ID!
		hostId: ID!
		## YEET
		name: String!
		accessibility: Float
		activityType: String
		participantAmount: Int
		price: Float
		link: String
		key: ID
		## YEET
		location: String
		timestamp: String
		active: Boolean
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
		generatedActivities: () => boredAPI.generateActivities(),
		generatedActivity: async () => {
			const generated = await boredAPI.generateActivity()
			const activity = generated
			activity.id = casual.uuid
			activity.hostId = casual.uuid
			activity.location = casual.city
			activity.timestamp = moment()
			return activity
		}
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
