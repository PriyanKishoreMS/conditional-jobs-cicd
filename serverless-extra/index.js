module.exports.handler = async event => {
	return {
		statusCode: 200,
		body: JSON.stringify(
			{
				message: "This is the now modified message",
				input: event,
			},
			null,
			2
		),
	};
};
