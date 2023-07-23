apiVersion: "traefik.containo.us/v1alpha1"
kind:       "IngressRoute"
metadata: {
	name:      string
	namespace: string
}
spec: {
	entryPoints: [
		"web",
	]
	routes: [{
		match: string
		kind:  "Rule"
		services: [{
			name: string
            port: >0 & <= 65535
		}]
	}]
}
