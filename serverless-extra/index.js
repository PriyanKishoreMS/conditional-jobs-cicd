module.exports.handler = async event => {
	return {
		statusCode: 200,
		body: JSON.stringify(
			{
				message: "This is now working 4",
				input: event,
			},
			null,
			2
		),
	};
};
