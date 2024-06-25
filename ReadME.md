This file contains the written responses as well as instructions needed for the exercises where applicable.


Part I 

Task 1
- If the attackers gained access via a web application, then the most likely attack vectors were probably command injection, remote command execution, SQL injection, or a similar attack vector allowing the attacker to achieve a remote shell.
- With a remote shell on the web server, the attackers could have escalated privileges on the machine, found network or other credentials, and pivoted to other endpoints within the same network. They may also set up beacons or backdoors to maintain persistence.
- Always keep software fully patched and up to date. For any input parameters, be sure to sanitize inputs to prevent these sorts of injection-based attacks.

Task 2

A sample incident response plan might include the following:
- Activate the incident response team and the designated managers. This team should provide notification whenever possible throughout this process to the relevant stakeholders.
- The IR team should disconnect any affected systems from the internet and shut them down if necessary. The affected systems should be isolated from other endpoints and services to the extent possible.
- It should perform a forensic analysis to identify the source of the compromise and any affected systems, taking images / snapshots where applicable to preserve the original evidence.
- Perform vulnerability scans and forensic analyses to identify any malware, backdoors, rootkits, or other harmful artifacts left by the attackers. These must be removed and the systems rescanned to ensure they are clean before service is restored.
- Restore service when it has been determined that the incident is under control.
- Perform a blameless post-mortem to review the relevant facts of the matter, identify improvements in processes and help harden the company's security posture, and implement the lessons learned to prevent future attacks.

Task 3

Possible network security measures may include: 
- Intrusion Detection / Prevention Systems: IDS are used to scan resources and alert on potential signs of compromise, while IPS work to prevent intrusion in the first place. 
- Code / container scans: These happen before code or containers are deployed to make sure there are no vulnerabilities in dependencies or the code or containers themselves. 
- Firewalls: Make sure firewall and security group rules are configured correctly to avoid exposing sensitive services to the internet. 
- Harden resources: Apply best practices for hardening operating systems, Kubernetes clusters / Docker containers, database instances, and any other resources your environment contains. Appling WAFs to exposed websites is also a best practice in this regard.


Part II

Task 1 

Docker container security best practices include: 
1. Do not pull base images from insecure registries like Docker Hub, but instead use hardened images from secure registries like Iron Bank
2. Choose a minimalist / secure image as a base, and keep it and all packages up to date throughout the container’s lifetime
3. Use multistage builds to remove build-time dependencies and packages from the final runtime container to minimize the attack surface (this has the added bonus of slimming down the final image)
4. Ensure container images are set to be read-only to minimize the possibility of attacks that utilize the file system
5. Create a non-root user and run the container as this user

See the Dockerfile in this repo. Please note that this is just a sample for illustration purposes, with temporary stand-in values used. Security practices demonstrated include: 
- Using updated / minimal images 
- Using multistage builds to remove unnecessary packages 
- Running as a nonroot user 

Task 2 

The following are three examples of Kubernetes security features.
1. Role-based access controls (RBAC): This is a way of locking down privileges in a cluster by defining what actions users or service accounts can perform on which resources.
2. Network policies: This is a way of shaping traffic within a cluster by defining which pods can communicate with other entities, as well as information like the ports and protocols used.
3. Security contexts: These define privileges, capabilities, and acces control settings for pods, such as running pods in unpriviliged mode, using security programs like SELinux and AppArmor, making the file system read-only, and more.

See pod.yaml in this repo for an example of security contexts in use. 

Task 3

Infrastructure as a Service (IaaS) refers to the provisioning of compute resources (including compute, storage, networking tools, and more) on an on-demand basis. Since users themselves are responsible for the configuration of these infrastructure resources, the majority of the burden is on them to ensure that there are no security misconfigurations in the resources, and that other security best practices surrounding matters like authentication and encryption are followed.     


Part III

Task 1

See the ansible-playbook.yaml file in this repo. 
Enter the IP address in the hosts section prior to running.
Note this is a simple playbook, but for more complex tasks a role should be used. 

Task 2

N/A

Task 3

See the .github/workflows/lambda.yaml file in this repo.
Please note that the S3_BUCKET and REGION environment variables must be set before running. 
The AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY secrets must also be set with valid credentials prior to running.
It's set to trigger on a push to the main branch for testing purposes.

