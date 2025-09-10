output "resource" {
  description = "The resource of email communication service"
  value       = azapi_resource.email_communication_service
}

output "resource_id" {
  description = "The resource ID of email communication service"
  value       = azapi_resource.email_communication_service.id
}

output "resource_in_azurerm_schema" {
  description = "The resource of email communication service in azurerm schema"
  value       = local.azurerm_resource_body
}

output "domains" {
  description = "All attributes of created email communication service domains"
  value = {
    for key, domain in azapi_resource.email_communication_service_domain :
    key => {
      id                 = domain.id
      name               = domain.name
      location           = domain.location
      parent_id          = domain.parent_id
      type               = domain.type
      body               = domain.body
      tags               = domain.tags
      identity           = try(domain.identity, null)
      response_export_values = try(domain.response_export_values, null)
      output             = try(domain.output, null)
    }
  }
}
