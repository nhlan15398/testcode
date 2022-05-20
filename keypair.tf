resource "tls_private_key" "nhlan-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "nhlan-public-key" {
  key_name   = "nhlan-public-key"
  public_key = tls_private_key.nhlan-private-key.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${tls_private_key.nhlan-private-key.private_key_pem}'> ./nhlan-private-key.pem"
  }
}