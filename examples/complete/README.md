# Complete Example

This example demonstrates the complete usage of the DataV for Digitalization module, which creates the infrastructure required for quickly building enterprise management dashboards.

## Architecture

This example creates the following resources:

- **VPC**: Virtual Private Cloud for network isolation
- **VSwitch**: Virtual Switch within the VPC for subnet management
- **Security Group**: Network security rules for resource access control
- **RDS Instance**: MySQL database instance for data storage
- **Database**: MySQL database within the RDS instance
- **Database Account**: Database user account with appropriate permissions

## Usage

1. Clone this repository and navigate to the example directory:
   ```bash
   cd examples/complete
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```


## Clean Up

To destroy the created resources:

```bash
terraform destroy
```