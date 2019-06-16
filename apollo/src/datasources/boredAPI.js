// const _encodeObject = (params) => Object.keys(params).map(key => key + '=' + params[key]).join('&')
import axios from 'axios'

/* Generates transient activity list of which one is launched */
const generateActivities = async (count = 4) => {
	const baseUrl = 'http://www.boredapi.com/api/activity?'
	let activities = []
	for (let i = 0; i < count; i++) {
		const resp = await axios.get(`${baseUrl}`)
		const data = resp.data
		data.name = data.activity
		data.activityType = data.type
		data.participantAmount = data.participants
		activities.push(data)
	}
	activities = Promise.all(activities)
	return activities
}

export const boredAPI = {
	generateActivities
}
