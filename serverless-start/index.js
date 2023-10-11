const serverless = require("serverless-http");
const express = require("express");
const app = express();

app.get("/", (req, res, next) => {
	return res.status(200).json({
		message: "I did ci/cd da venna mavane!",
	});
});

app.get("/path", (req, res, next) => {
	return res.status(200).json({
		message: "Hello from path!",
	});
});

app.get("/check", (req, res, next) => {
	return res.status(200).json({
		message: "Hello from check path!",
	});
});

app.use((req, res, next) => {
	return res.status(404).json({
		error: "Not Found",
	});
});

module.exports.handler = serverless(app);
