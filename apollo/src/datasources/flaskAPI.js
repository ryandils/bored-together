import axios from 'axios'

const BASE_URL = '/'

/* AUTH */

/* Create user upon signup */
const createUser = async (user) => {
	const endpoint = 'create-user'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, user )
	} catch (err) {
		console.log(err)
	}
}

const userExists = async (email) => {
	const endpoint = '/user-exists'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { email })
	} catch (err) {
		console.log(err)
	}
}

/* Get userId upon login */
const login = async (email) => {
	const endpoint = '/user-id'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { email })
	} catch (err) {
		console.log(err)
	}
}

/* ********************************************************************************************* */
/* ACTIVITY */

const getActivity = async (id) => {
	// TODO
}

/* Get a randomly selected active activity */
const getActiveActivity = async () => {
	// Grab activities
	const endpoint = '/get-active-activities'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url)
	} catch (err) {
		console.log(err)
	}

	// Pick activity at random
	// return _chooseActivity(activities)
}

/* Pick activity randomly out of list of activities */
const _chooseActivity = (activities) => {
	return activity = activities[Math.floor(Math.random() * items.length)]
}

/* Create activity in database */
const createActivity = async (activity) => {
	const endpoint = '/create-activity'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { activity })
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
const _closeActivity = async () => {
	const endpoint = '/deactivate-activity'
	const url = `${BASE_URL}${endpoint}`
	try {
		await axios.post(url, { email })
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

export const bigQueryAPI = {
	createUser,
	userExists,
	login,
	getActiveActivity,
	getActivity,
	createActivity,
	joinActivity,
}
