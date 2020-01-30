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

output "ceritificate_pem" {
  value = acme_certificate.domain-cert.certificate_pem
}

output "private_key_pem" {
  value = acme_certificate.domain-cert.private_key_pem
}

output "issuer_pem" {
  value = acme_certificate.domain-cert.issuer_pem
}
