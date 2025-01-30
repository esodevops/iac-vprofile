# Terraform

## goals

### . Automation the provisioning of the infra
. Supporting the different architecture(iaas,saas,paas)
. managing anything via API
. managing any cloud provider and one premise (technology agnostic)



## Benefits

### .Time management
. Reduce human error
. code versioning
. scalability
. Separate the planning from excecutions (dry-run)


## workflow

### terraform init

- what happens ?

	- Initialize the working directory
	- Downloads the necessary providers and modules
	- prepare the backend of state file

### terraform plan

- what happens ?

	- Checks the configurations files
	- Compares those with the current state ( state of your infrastructure)
	- Shows a preview of the changes to be made

### terraform apply

- what happens ?

	- Provisions the resources on your Cloud provider (AWS)
	- Update the state file

## Different backend (use to store the state file)

### Local backend (inside my computer)

### Remote Backend (HCP, s3, azure blob storage, consul ...)

## CRUD

### CUD

- Create the resouce
- Update the resource
- Delete the resource

### R

- Read the resource

## State locking

*XMind - Trial Version*
