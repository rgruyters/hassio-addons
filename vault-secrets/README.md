# Vault secrets - Hass.io add-on for Home Assistant

This add-on allows you to retrieve secrets from a remote Vault service.
[Vault](https://vaultproject.io) is a tool from [Hashicorp](https://hashicorp.com). It allows you to secure, store and tightly control access to tokens, passwords, certificates, encryption keys for protecting secrets and other sensitive data using a UI, CLI, or HTTP API.

Before using this add-on make sure you have created a Vault token with the correct policy.

Create the following policy:

```hcl
path "secret/hassio" {
  capabilities = ["read", "list"]
}
```

Add the policy to Vault service:

```bash
vault policy write hassio ./hassio_policy.hcl
```

To able to access the Vault service, create a Vault token voor Home Assistant.

```bash
vault token create -policy=hassio -orphan
```

