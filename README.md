<p align="center">
<img width="200" src="doc/img/sublin-logo-black.png">
</p></br>

# Sublin App
Sublin is a MaaS (Mobility-as-a-Service) app for end users, transport operators and sponsors. Sponsors provide transport services that are carried out by transport operators so end users are not charged for. The goal of Sublin is to provide seamless intermodal routes between A and B without one's own car combining public transport with on demand transportation services. 

## Prototype
The Sublin app connects with a Firebase project. The app creates intermodal routes and combines scheduled puplic transportation with on demand transportation services. The prototype is connected with a Firebase backend. The Firebase backend evolves into a provider [agnostic digital mobility](https://github.com/schadauer/Sublin-Digital-Mobility-Hub).

The prototpye accomodates three different user types. A [demo video](https://youtu.be/fUwMlH78LVI) featuring all three types can be is available here.

### End user
End users can book an intermodal route. Only addresses are available that are either accessible via public transportation or via an on demand transport operator if the address is sponsored by sponsors like bussinesses for their employees, hotels for their guests or city councils for their citizens etc.

### Transport operator (provider)
Transport operators can choose the areas they offer their services in and a train station where they provide shuttle services from. With the prototype only one train station can be picked. 

### Sponsor
Sponsors can either sponsor legs to a particular address or to all address within the bounds of an area - either for all or limited to a specified list of users. 

## Goal
The app will connect to the Sublin mobility hub with a GraphQL client whereas an abstraction interface will be developed that allows other types of services as well. 

Sublin adhere to the [TOMP API](https://app.swaggerhub.com/apis/TOMP-API-WG/transport-operator_maas_provider_api/) specification. GraphQL calls resolve to the API endpoints described in this specification. Calls from the hub to the GraphQL connector will be subscribed to using GraphQL subscription.

<p align="center">
<img width='500' src="doc/img/sublin-graphql-connector.png">
</p>


## Milestones
TBD


## License
MIT