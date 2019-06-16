import axios from 'axios'

const BASE_URL = '/'

/* AUTH */

/* Create user upon signup */
const createUser = async (user) => {
	const endpoint = 'create-user'
	const url = `${BASE_URL}${endpoint}`
	const data = {
		user_id: user.id,
		email_address: user.email,
		facebook_token: user.facebookToken,
		first_name: user.firstName,
		last_name: user.lastName,
		dob: user.dob,
		gender: user.gender,
		profile_picture_url: user.profilePictureUrl
	}
	try {
		await axios.post(url, data )
		return {
			success: true
		}
	} catch (err) {
		console.log(err)
		return {
			success: false
		}
	}
}

const userExists = async (email) => {
	const endpoint = '/user-exists'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.get(url, { email })
	} catch (err) {
		console.log(err)
	}
}

/* Get userId upon login */
const login = async (email) => {
	const endpoint = '/user-id'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.get(url, { email })
	} catch (err) {
		console.log(err)
	}
}

/* ********************************************************************************************* */
/* ACTIVITY */

/* Pick activity randomly out of list of activities */
const _chooseActivity = (activities) => {
	return activity = activities[Math.floor(Math.random() * items.length)]
}

/* Get a randomly selected active activity */
const getActiveActivity = async () => {
	// Grab activities
	const endpoint = '/get-active-activities'
	const url = `${BASE_URL}${endpoint}`
	let activities = []
	try {
		activities = await axios.get(url)
	} catch (err) {
		console.log(err)
	}

	// Pick activity at random
	return _chooseActivity(activities)
}

/* Create activity in database */
const createActivity = async (activity) => {
	const endpoint = '/create-activity'
	const url = `${BASE_URL}${endpoint}`
	const data = {
		activity_id: activity.id,
		host_id: activity.hostId,
		name: activity.name,
		accessibility: activity.accessibility,
		activity_type: activity.activityType,
		participant_amount: activity.participantAmount,
		price: activity.price,
		link: activity.link,
		activity_key: activity.key,
		loc: activity.location,
		timestp: activity.timestamp,
		active: activity.active
	}
	try {
		await axios.post(url, data)
	} catch (err) {
		console.log(err)
	}
}

/* Add user to activity */
const joinActivity = async (userId, activityId) => {
	// If full, send error
	const endpoint1 = '/is-activity-full'
	const url1 = `${BASE_URL}${endpoint1}`
	try {
		await axios.post(url1, { activityId })
	} catch (err) {
		console.log(err)
	}
	// Else, add user to activity
	const endpoint = '/join-activity'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { userId, activityId })
	} catch (err) {
		console.log(err)
	}
}

/* Set the activity to be closed, so it can no longer be joined */
const _closeActivity = async (activity_Id) => {
	const endpoint = '/deactivate-activity'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { activity_Id })
	} catch (err) {
		console.log(err)
	}
}

/* ********************************************************************************************* */
/* USER */

const getUser = async (id) => {
	// TODO
}

const getUsersById = async (ids) => {
	// TODO
}

export const flaskAPI = {
	createUser,
	userExists,
	login,
	getActiveActivity,
	createActivity,
	joinActivity,
}
