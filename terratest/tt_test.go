package tt_eks

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraform(t *testing.T) {
	t.Parallel()

	expectedText := "test"
	expectedList := []string{expectedText}
	expectedMap := map[string]string{"expected": expectedText}

	// Construct the terraform options with default retryable errors to handle
	// the most common retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "/home/re92534z/terraform/aws/eks/terraform-aws-eks-prometheus-grafana-blackbox/eks-cluster",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"terraform.tfvars"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" & "terraform apply". Fail the test if any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	// and check they have the expected values.
	// ///////output := terraform.Output(t, terraformOptions, "EKS deployed")
	// ///////assert.Equal(t, "EKS, Success", output)

	// Run `terraform output` to get the values of output variables
	actualTextExample := terraform.Output(t, terraformOptions, "example")
	actualTextExample2 := terraform.Output(t, terraformOptions, "example2")
	actualExampleList := terraform.OutputList(t, terraformOptions, "example_list")
	actualExampleMap := terraform.OutputMap(t, terraformOptions, "example_map")

	// website::tag::3::Check the output against expected values.
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedText, actualTextExample)
	assert.Equal(t, expectedText, actualTextExample2)
	assert.Equal(t, expectedList, actualExampleList)
	assert.Equal(t, expectedMap, actualExampleMap)
}
