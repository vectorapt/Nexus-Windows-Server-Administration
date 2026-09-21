# 🖥️ Nexus — Windows Server 2025 & Active Directory Administration Lab

## 📌 Overview

Project Nexus is a hands-on Windows systems administration lab demonstrating the deployment, configuration, and administration of a small enterprise Windows environment.

The project simulates two office locations, Dublin and London, using Windows Server 2025 and Windows 11 Pro. It focuses on Active Directory, identity and access management, Group Policy, file services, workstation security, and practical administration.

## 🎯 Objectives

- Deploy and configure Windows Server 2025
- Implement Active Directory Domain Services
- Configure DNS and DHCP
- Create and manage Organizational Units, users, and security groups
- Join and administer a Windows 11 domain workstation
- Configure and apply Group Policy
- Implement departmental file shares and NTFS permissions
- Map network drives using Group Policy Preferences
- Configure workstation security settings
- Test authorised and unauthorised access
- Document configuration and verification results

## 🧱 Environment

- Windows Server 2025
- Windows 11 Pro
- VMware virtualisation
- Active Directory domain: `NEXUS.local`
- Two simulated office locations: Dublin and London
- Active Directory Domain Services
- DNS and DHCP
- SMB file sharing
- PowerShell administration

## 👥 Users Created

The lab includes departmental users organised by office location:

### Dublin

- IT
  - Alex Murphy
  - David Ryan
- Finance
  - James Walsh
- HR
  - Emma Doyle

### London

- IT
  - Sophie Jones
  - Daniel Smith
- Finance
  - George Harris
- HR
  - Amelia Taylor

Users are organised within their respective departmental Organizational Units and managed through Active Directory security groups and Group Policy.

## 🔧 Key Tasks Performed

### 🌐 Network & Server Configuration

- Configured VMware NAT and isolated internal networking
- Configured server and workstation network interfaces
- Assigned static addressing to the domain controller
- Configured DNS and DHCP
- Verified connectivity and name resolution

### 🏢 Active Directory Deployment

- Installed Active Directory Domain Services
- Promoted Windows Server 2025 to a domain controller
- Created the `NEXUS.local` domain
- Created Dublin and London Organizational Units
- Created departmental OUs for IT, Finance, and HR
- Created and managed domain users, groups, and computer accounts
- Joined a Windows 11 workstation to the domain

### 🔐 Identity & Access Management

- Created departmental security groups
- Organised users and computers according to office location
- Configured department-based resource access
- Verified domain authentication
- Tested authorised and unauthorised resource access

### ⚙️ Group Policy Administration

- Created and linked computer and user Group Policy Objects
- Disabled the Guest account through Group Policy
- Configured user environment restrictions
- Configured Windows Defender Firewall settings
- Applied policies according to office location and user department
- Verified policy application using `gpresult`

### 📁 File Services & Permissions

- Created departmental SMB shares for IT, Finance, and HR
- Configured share and NTFS permissions
- Applied department-based access control using security groups
- Configured network drive mappings using Group Policy Preferences
- Used item-level targeting for departmental drive access
- Tested authorised and unauthorised share access

### 🧪 Testing & Verification

- Verified domain connectivity and DNS resolution
- Confirmed successful domain authentication
- Used PowerShell to inspect Active Directory objects and system configuration
- Verified computer and user Group Policy application
- Tested file-share permissions using different domain accounts
- Performed authorised and unauthorised access tests
- Documented configuration and verification results

## 🧠 Key Learnings

- Active Directory provides centralised management of users, computers, and access
- Organizational Units provide structure for users, computers, and policy application
- Group Policy enables consistent security and configuration management
- Share and NTFS permissions work together to control resource access
- Group-based access control is more manageable than assigning permissions individually
- DNS and DHCP are essential for reliable domain operation
- Practical testing and verification are critical parts of systems administration
- PowerShell supports repeatable administration and environment verification

## 🚀 Outcome

Project Nexus demonstrates practical Windows systems administration skills across Active Directory, DNS, DHCP, Group Policy, identity and access management, file services, workstation security, and PowerShell-based administration.

The project provides hands-on experience with core technologies and administrative tasks used in enterprise Windows environments.
