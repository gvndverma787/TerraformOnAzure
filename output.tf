output "ProdSubnet" {
  value = azurerm_subnet.subnet1.id
  description = "This is prod subnet id"
}

output "DevSubnet" {
  value = azurerm_subnet.subnet2.id
  description = "This is dev subnet id"
}