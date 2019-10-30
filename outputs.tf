output "certificate_name" {
  value = "${acme_certificate.domain-cert.common_name}.pfx"
}

output "domain_name" {
  value = acme_certificate.domain-cert.common_name
}

output "ceritificate_p12" {
  value = acme_certificate.domain-cert.certificate_p12
}

output "ceritificate_p12_password" {
  value = acme_certificate.domain-cert.certificate_p12_password
}