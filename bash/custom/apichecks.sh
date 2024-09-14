apicheckst() {
	echo "newman run -e src/test/postman/$1.postman_environment.json src/test/postman/apichecks.postman_collection.json"
	newman run -e "src/test/postman/$1.postman_environment.json" "src/test/postman/apichecks.postman_collection.json"
}
