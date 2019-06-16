/* AUTH */

/* Create user upon signup */
const createUser = async () => {
	// TODO
}

/* Get userId upon login */
const login = async () => {
	// TODO
}

/* ********************************************************************************************* */
/* ACTIVITY */

const getActivity = async (id) => {
	// TODO
}

/* Get a randomly selected active activity */
const getActiveActivity = async () => {
	// Grab activities

	// Pick activity at random
	// return _chooseActivity(activities)
}

/* Pick activity randomly out of list of activities */
const _chooseActivity = (activities) => {
	return activity = activities[Math.floor(Math.random() * items.length)]
}

/* Create activity in database */
const createActivity = async (activity) => {
	const { id, hostId, name, accessibility, activityType, participantAmount, price, link, key, location, timestamp } = activity
	const query = `
		INSERT INTO Activities (id, hostId, accessibility, activityType, participantAmount, price, link, key, location, timestamp)
		VALUES (${id}, ${hostId}, ${name}, ${accessibility}, ${activityType}, ${participantAmount}, ${price}, ${link}, ${key}, ${location}, ${timestamp})
	`
}

/* Add user to activity */
const joinActivity = async () => {
	// If full, send error
	// Else, add user to activity
}

/* Set the activity to be closed, so it can no longer be joined */
const _closeActivity = async () => {
	// TODO
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
	login,
	getActiveActivity,
	getActivity,
	createActivity,
	joinActivity,
}
