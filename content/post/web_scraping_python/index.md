---
title: Web Scraping using Python
subtitle: A couple of simple examples of how to extract data online.

tags: []
categories: []

date: "2022-07-11"
lastMod: "2022-07-11"
featured: false
draft: false

---

Web scraping can be a very useful tool for a wide range of problems. For example, it may allow to compute a new dataset, get high-frequency information on financial variables, adopt a pet (see [link](https://acarril.github.io/posts/adopt-dog-python)) or even look for a new job.

When I was applying for RA positions, I designed a code to email me new opening for RA positions posted at the [NBER website](https://www.nber.org/career-resources/research-assistant-positions-not-nber) on a daily basis. 

Here a set of [slides](/files/web_scraping_slides.pdf) that walk through this example + the same example on a more complex website using selenium.

Finally, to email updates on the NBER I proceed as follows. 

0. load email-specific python packages
```python
    import smtplib
    from email.mime.text import MIMEText
    from email.mime.multipart import MIMEMultipart
```
1. Check if the stored dataset of job openings exist and then open it as a data frame:     
    ```python
    df_old = pd.read_csv('current_jobs.csv',sep=';',index_col=False)
    ```

2. Look for differences in the old *vis-a-vis* new data.
    ```python
    diffs = list(set(df.id) ^ set(df_old.id)) # id: job opening id
    ```

3. If there are differences, create lists for added/gone openings.
    ```python 
    # compute sets of added and removed jobs, create corresponding dataframes (email)
    added    = list(set(df.id) - set(df_old.id))
    gone     = list(set(df_old.id) - set(df.id))
    dfAdded  = df[df['id'].isin(added)]
    dfGone   = df_old[df_old['id'].isin(gone)]
    ```

4. Email new openings and filled positions:
```python
    # send new jobs

    # subject
    if len(added) > 0:
        subject = 'New Opening Alert!'
    else:
        subject = 'Closed positions.'

    # sender
    sender = 'your_email@gmail.com'
    password = 'your_password'
    smtp_server = "smtp.gmail.com"
    port = 587

    # recepient
    recipient  = 'your_email@gmail.com'

    msg = MIMEMultipart()
    msg['From'] = sender
    msg['To'] = recipient
    msg['Subject'] = subject  


    message = f"""\
    Check changes in RA openings below 
    Opened:
    {dfAdded[['pos_name', 'researcher', 'institution', 'field', 'link']].stack().to_string(index=False)}
    Closed:
    {dfGone[['pos_name', 'researcher', 'institution', 'field', 'link']].stack().to_string(index=False)}
    """
    msg.attach(MIMEText(message,'plain')) 

    smtpObj = smtplib.SMTP(smtp_server, port)
    smtpObj.ehlo()
    smtpObj.starttls()
    smtpObj.login(sender, password)
    smtpObj.sendmail(sender, recipient, msg.as_string())
    smtpObj.quit()

    fileName = 'current_jobs.csv'
    df.to_csv(fileName,na_rep='.',sep=';',index=False)
```



