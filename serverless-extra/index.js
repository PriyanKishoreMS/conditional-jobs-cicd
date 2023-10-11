module.exports.handler = async event => {
	return {
		statusCode: 200,
		body: JSON.stringify(
			{
				message: "This is the new updated message",
				input: event,
			},
			null,
			2
		),
	};
};
