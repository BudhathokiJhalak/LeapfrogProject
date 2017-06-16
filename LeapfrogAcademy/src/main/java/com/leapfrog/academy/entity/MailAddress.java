/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author zak
 */
@Entity
@Table(name = "tbl_mail_address")
@NamedQueries({
    @NamedQuery(name = "MailAddress.findAll", query = "SELECT m FROM MailAddress m")})
public class MailAddress implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mail_address_id")
    private Integer mailAddressId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "mail_address")
    private String mailAddress;
    @Basic(optional = false)
    @Column(name = "added_date", insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate;
    @Column(name = "modified_date", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    public MailAddress() {
    }

    public MailAddress(Integer mailAddressId) {
        this.mailAddressId = mailAddressId;
    }

    public MailAddress(Integer mailAddressId, String mailAddress, Date addedDate) {
        this.mailAddressId = mailAddressId;
        this.mailAddress = mailAddress;
        this.addedDate = addedDate;
    }

    public Integer getMailAddressId() {
        return mailAddressId;
    }

    public void setMailAddressId(Integer mailAddressId) {
        this.mailAddressId = mailAddressId;
    }

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mailAddressId != null ? mailAddressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MailAddress)) {
            return false;
        }
        MailAddress other = (MailAddress) object;
        if ((this.mailAddressId == null && other.mailAddressId != null) || (this.mailAddressId != null && !this.mailAddressId.equals(other.mailAddressId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.leapfrog.academy.entity.MailAddress[ mailAddressId=" + mailAddressId + " ]";
    }
    
}
