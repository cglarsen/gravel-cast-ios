import requests

# Script input
routeId = "29292384"
segmentCreatorIds = [131249]
apiKey = "8e3224f9"
rwgpsVersion = 2
# End inputs


# Main script 

# Constructing request
url = "https://ridewithgps.com/routes/"
url = url + routeId + ".json"
payload = {'apikey': apiKey, 'version': rwgpsVersion}

resp = requests.get(url, payload)

print("Fecthing route {} from {}".format(routeId, url))

if resp.status_code != 200:
    # This means something went wrong.
    raise ApiError('GET /tasks/ {}'.format(resp.status_code))

data = resp.json()
print("Type: {}".format(data['type']))
print("Route name: {}".format(data['route']['name']))

foundSegments = []
for segment in data['route']['segment_matches']:
	segmentCreatorId = segment['user_id']
	segmentSlug = segment['segment']['slug']
	if segmentCreatorId in segmentCreatorIds:
		print("Segment named {} created by route creator and added to list".format(segmentSlug))
		foundSegments.append(segment)
	else:
		print("Segment named {} NOT created by route creator".format(segmentSlug))

print("Found {} matched segments".format(len(foundSegments)))