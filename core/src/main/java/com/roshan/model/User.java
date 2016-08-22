package com.roshan.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.Version;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * This class represents the basic "user" object in Roar that allows for authentication and user management. It
 * implements Spring Security's UserDetails interface.
 *
 * @author roshan
 */
@Entity
@Table(name = "app_user")
@Indexed
@XmlRootElement
public class User extends BaseObject implements UserDetails {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 3832626162173359411L;

    /** The id. */
    private Long id;

    /** The username. */
    private String username;

    /** The password. */
    private String password;

    /** The confirm password. */
    private String confirmPassword;

    /** The password hint. */
    private String passwordHint;

    /** The first name. */
    private String firstName;

    /** The last name. */
    private String lastName;

    /** The email. */
    private String email;

    /** The phone number. */
    private String phoneNumber;

    /** The website. */
    private String website;

    /** The address. */
    private Address address = new Address();

    /** The version. */
    private Integer version;

    /** The roles. */
    private Set<Role> roles = new HashSet<>();

    /** The enabled. */
    private boolean enabled;

    /** The account expired. */
    private boolean accountExpired;

    /** The account locked. */
    private boolean accountLocked;

    /** The credentials expired. */
    private boolean credentialsExpired;

    /** The profile picture. */
    private byte[] profilePicture;

    /** The profile picture src. */
    private String profilePictureSrc;

    /**
     * Default constructor - creates a new instance with no values set.
     */
    public User() {
    }

    /**
     * Create a new instance and set the username.
     *
     * @param username login name for user.
     */
    public User(final String username) {
        this.username = username;
    }

    /**
     * Gets the id.
     *
     * @return the id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @DocumentId
    public Long getId() {
        return this.id;
    }

    @Override
    @Column(nullable = false, length = 50, unique = true)
    @Field
    public String getUsername() {
        return this.username;
    }

    @Override
    @Column(nullable = false)
    @XmlTransient
    @JsonIgnore
    public String getPassword() {
        return this.password;
    }

    /**
     * Gets the confirm password.
     *
     * @return the confirm password
     */
    @Transient
    @XmlTransient
    @JsonIgnore
    public String getConfirmPassword() {
        return this.confirmPassword;
    }

    /**
     * Gets the password hint.
     *
     * @return the password hint
     */
    @Column(name = "password_hint")
    @XmlTransient
    public String getPasswordHint() {
        return this.passwordHint;
    }

    /**
     * Gets the first name.
     *
     * @return the first name
     */
    @Column(name = "first_name", nullable = false, length = 50)
    @Field
    public String getFirstName() {
        return this.firstName;
    }

    /**
     * Gets the last name.
     *
     * @return the last name
     */
    @Column(name = "last_name", nullable = false, length = 50)
    @Field
    public String getLastName() {
        return this.lastName;
    }

    /**
     * Gets the email.
     *
     * @return the email
     */
    @Column(nullable = false, unique = true)
    @Field
    public String getEmail() {
        return this.email;
    }

    /**
     * Gets the phone number.
     *
     * @return the phone number
     */
    @Column(name = "phone_number")
    @Field(analyze = Analyze.NO)
    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    /**
     * Gets the website.
     *
     * @return the website
     */
    @Field
    public String getWebsite() {
        return this.website;
    }

    /**
     * Gets the image.
     *
     * @return the image
     */

    /**
     * Gets the profile picture.
     *
     * @return the profilePicture
     */
    @Lob
    @Column(name = "profile_picture", columnDefinition = "mediumblob")
    public byte[] getProfilePicture() {
        return this.profilePicture;
    }

    /**
     * Returns the full name.
     *
     * @return firstName + ' ' + lastName
     */
    @Transient
    public String getFullName() {
        return this.firstName + ' ' + this.lastName;
    }

    /**
     * Gets the address.
     *
     * @return the address
     */
    @Embedded
    @IndexedEmbedded
    public Address getAddress() {
        return this.address;
    }

    /**
     * Gets the roles.
     *
     * @return the roles
     */
    @ManyToMany(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "user_role", joinColumns = {
        @JoinColumn(name = "user_id")}, inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return this.roles;
    }

    /**
     * Convert user roles to LabelValue objects for convenience.
     *
     * @return a list of LabelValue objects with role information
     */
    @Transient
    public List<LabelValue> getRoleList() {
        List<LabelValue> userRoles = new ArrayList<>();

        if (this.roles != null) {
            for (Role role : this.roles) {
                // convert the user's roles to LabelValue Objects
                userRoles.add(new LabelValue(role.getName(), role.getName()));
            }
        }

        return userRoles;
    }

    /**
     * Adds a role for the user.
     *
     * @param role the fully instantiated role
     */
    public void addRole(Role role) {
        getRoles().add(role);
    }

    /**
     * Gets the authorities.
     *
     * @return GrantedAuthority[] an array of roles.
     * @see org.springframework.security.core.userdetails.UserDetails#getAuthorities()
     */
    @Override
    @Transient
    @JsonIgnore // needed for UserApiITest in appfuse-ws archetype
    public Set<GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new LinkedHashSet<>();
        authorities.addAll(this.roles);
        return authorities;
    }

    /**
     * Gets the version.
     *
     * @return the version
     */
    @Version
    public Integer getVersion() {
        return this.version;
    }

    /**
     * Gets the profile picture src.
     *
     * @return the profilePictureSrc
     */
    @Transient
    @XmlTransient
    @JsonIgnore
    public String getProfilePictureSrc() {
        return this.profilePictureSrc;
    }

    @Override
    @Column(name = "account_enabled")
    public boolean isEnabled() {
        return this.enabled;
    }

    /**
     * Checks if is account expired.
     *
     * @return true, if is account expired
     */
    @Column(name = "account_expired", nullable = false)
    public boolean isAccountExpired() {
        return this.accountExpired;
    }

    /**
     * Checks if is account non expired.
     *
     * @return true if account is still active
     * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonExpired()
     */
    @Override
    @Transient
    public boolean isAccountNonExpired() {
        return !isAccountExpired();
    }

    /**
     * Checks if is account locked.
     *
     * @return true, if is account locked
     */
    @Column(name = "account_locked", nullable = false)
    public boolean isAccountLocked() {
        return this.accountLocked;
    }

    /**
     * Checks if is account non locked.
     *
     * @return false if account is locked
     * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonLocked()
     */
    @Override
    @Transient
    public boolean isAccountNonLocked() {
        return !isAccountLocked();
    }

    /**
     * Checks if is credentials expired.
     *
     * @return true, if is credentials expired
     */
    @Column(name = "credentials_expired", nullable = false)
    public boolean isCredentialsExpired() {
        return this.credentialsExpired;
    }

    /**
     * Checks if is credentials non expired.
     *
     * @return true if credentials haven't expired
     * @see org.springframework.security.core.userdetails.UserDetails#isCredentialsNonExpired()
     */
    @Override
    @Transient
    public boolean isCredentialsNonExpired() {
        return !this.credentialsExpired;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Sets the username.
     *
     * @param username the new username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Sets the password.
     *
     * @param password the new password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Sets the confirm password.
     *
     * @param confirmPassword the new confirm password
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * Sets the password hint.
     *
     * @param passwordHint the new password hint
     */
    public void setPasswordHint(String passwordHint) {
        this.passwordHint = passwordHint;
    }

    /**
     * Sets the first name.
     *
     * @param firstName the new first name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Sets the last name.
     *
     * @param lastName the new last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Sets the email.
     *
     * @param email the new email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Sets the phone number.
     *
     * @param phoneNumber the new phone number
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Sets the website.
     *
     * @param website the new website
     */
    public void setWebsite(String website) {
        this.website = website;
    }

    /**
     * Sets the address.
     *
     * @param address the new address
     */
    public void setAddress(Address address) {
        this.address = address;
    }

    /**
     * Sets the roles.
     *
     * @param roles the new roles
     */
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    /**
     * Sets the version.
     *
     * @param version the new version
     */
    public void setVersion(Integer version) {
        this.version = version;
    }

    /**
     * Sets the enabled.
     *
     * @param enabled the new enabled
     */
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    /**
     * Sets the account expired.
     *
     * @param accountExpired the new account expired
     */
    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    /**
     * Sets the account locked.
     *
     * @param accountLocked the new account locked
     */
    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    /**
     * Sets the credentials expired.
     *
     * @param credentialsExpired the new credentials expired
     */
    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }

    /**
     * Sets the profile picture.
     *
     * @param profilePicture the profilePicture to set
     */
    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
        this.profilePictureSrc = new String(profilePicture);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof User)) {
            return false;
        }

        final User user = (User) o;

        return !(this.username != null ? !this.username.equals(user.getUsername()) : user.getUsername() != null);

    }

    @Override
    public int hashCode() {
        return (this.username != null ? this.username.hashCode() : 0);
    }

    @SuppressWarnings("nls")
    @Override
    public String toString() {
        ToStringBuilder sb = new ToStringBuilder(this, ToStringStyle.DEFAULT_STYLE).append("username", this.username)
                .append("enabled", this.enabled).append("accountExpired", this.accountExpired)
                .append("credentialsExpired", this.credentialsExpired).append("accountLocked", this.accountLocked);

        if (this.roles != null) {
            sb.append("Granted Authorities: ");

            int i = 0;
            for (Role role : this.roles) {
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(role.toString());
                i++;
            }
        } else {
            sb.append("No Granted Authorities");
        }
        return sb.toString();
    }
}
