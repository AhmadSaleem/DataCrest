# README

1) Script to apply applications to each wholesaler for testing purposes
```
Wholesaler.all.each do |wholesaler|
  wholesaler.templates.create(class_name: 'JimcorDwellingApplication', title: 'Jimcor Dwelling Insurance Application')
end
```


# Models

## 1) Wholesaler
```
  It is an insurance company that may have many salespeople and one of the salesperson would be its owner. It can invite new salesperson and existing salesperson with pending invitaions, to join the plateform as its employees. It may have many templates and insurance applications. It may invite new agents to the plateform DataCrest and share applications with them. It can also share applications with existing agents. It can view the applications submitted by the clients. It can view all the agents and the applications assigned to each agent. It can update company information. It can update the status(complete, rejected, accepted or incomplete) of any insurance application.
```

## 2) Salesperson
```
  A salesperson is owner of some wholesaler or its employee. A person can also signed up and register their wholesaler on the platefrom. Salesperson belongs to a wholesaler company that we called the employees of that wholesaler. It may share applications with new agents and the existing agents. It can view the agents invited by its wholesaler. It can also view the applications submitted by the clients. 
```

## 3) Template
```
  It stores the information of the application available on DataCrest which can be assigned to a wholesaler. Wholesaler can share these templates with any agency and its agents. It could be shared among many agencies.
```

## 4) InsuranceApplication
```
  It stores the type of application assigned to a client. It bleongs to template and stores the status of the application. 
```

## 5) Agency
```
  It is a company registered on DataCrest which can invite the agents to join the agency as its employees and clients to complete the applications assigned by the wholesaler or the salesperson. It is owned by an agent who is either invited_by the wholesaler or signed up to join the Datacrest. It could have many applications and agents.It can ask the clients to complete the applications. Moreover , it can view the applicationS submitted by the client.```

## 6) Agent
```  
  Agent is similar to the saleperson. An agent is either invited by the wholesaler to join the Datacrest and create
  its agency or by the agency owner to join its agency on Datacrest. It can invite new and existing clients to complete any of the insurance applications assigned to its agency. It can also view the applications submmited by the clients of its agency and its own clients(which are invited by itself).
```

## 7) AgencyApplication
```
  It atores the information related to the templates which are assigned to an agency, agency agent to whom with it was shared and the wholesaler.
```

## 8) AgentWholesaler
```
  It stores the information related to the agents which are invited by an wholesaler or its employees. It also sotres the invitation status(pending, accepted) of the agent. 
```

## 9) Client
```
 A person who is capable of accepting applications from an agent and to complete them. A client is invited by an agent to register on plateform and complete the application. Moreover, Client can register on its own to the plateform and complete any of the applications hosted on datacrest. 
```

## 10) JimcorDwellingApplication
```
  It is Dwelling insurance application for the wholesaler Jimcor Agencies.
```