## <code style="color:green"> Assignment 7 (Postgress)</code>
### <code style="color:aqua">What is PostgreSQL</code>
-PostgreSQL হল একটি ওপেন-সোর্স, শক্তিশালী  রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম  যা SQL  ব্যবহার করে ডাটাবেস পরিচালনা করে। এটি Scalability, Security, এবং Extensibility ।

### <code style="color:aqua">What is the purpose of a database schema in PostgreSQ</code>
- স্কিমা হল ডাটাবেস অবজেক্ট গুছিয়ে রাখার একটি পদ্ধতি
PostgreSQL-এ স্কিমার প্রধান কাজগুলো:
1️⃣ ডাটাবেস অবজেক্ট গুছিয়ে রাখা:

স্কিমা ব্যবহার করলে একই ডাটাবেসের মধ্যে বিভিন্ন টেবিল ও ভিউ শ্রেণীবদ্ধভাবে রাখা যায়, যা ম্যানেজ করা সহজ করে।

2️⃣ নিরাপত্তা ও অ্যাক্সেস কন্ট্রোল বৃদ্ধি করা :

PostgreSQL-এ বিভিন্ন স্কিমার জন্য আলাদা অনুমতি (Permission) সেট করা যায়, যা ডাটা নিরাপদ রাখে।

যেমন: dev_schema ডেভেলপারদের জন্য এবং admin_schema অ্যাডমিনদের জন্য আলাদা রাখা যায়।

3️⃣ নাম দ্বন্দ্ব (Name Conflict) এড়ানো :

স্কিমা ব্যবহার করে একই নামের একাধিক টেবিল রাখা সম্ভব।

যেমন: sales.orders এবং inventory.orders একই ডাটাবেসে থাকতে পারে।

4️⃣ মাল্টি-টেন্যান্ট অ্যাপ্লিকেশনের জন্য কার্যকরী :

যদি একটি সফটওয়্যার বিভিন্ন গ্রাহকের জন্য পৃথক ডাটা রাখে, তাহলে প্রত্যেক গ্রাহকের জন্য আলাদা স্কিমা ব্যবহার করা যায়।
### <code style="color:aqua">Explain the Primary Key and Foreign Key concepts in PostgreSQL</code>

- Primary Key :
Primary Key হলো একটি ইউনিক কলাম বা কলামের সমষ্টি, যা প্রতিটি রেকর্ডকে অন্য রেকর্ড থেকে আলাদা করে।

📌 Primary Key-এর বৈশিষ্ট্য <br>
✔️ ইউনিক (Unique) হতে হবে → একই টেবিলে একাধিক রেকর্ডের জন্য একই Primary Key মান থাকতে পারবে না।<br>
✔️ NULL হতে পারবে না → অর্থাৎ Primary Key ফিল্ডে অবশ্যই একটি মান থাকতে হবে।<br>
✔️ একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে।<br>

- Foreign Key :<br>
Foreign Key হল একটি কলাম বা কলামের সেট, যা অন্য টেবিলের Primary Key কে রেফারেন্স (Reference) করে। এটি দুটি টেবিলের মধ্যে সম্পর্ক (Relationship) স্থাপন করে।<br>

📌 Foreign Key-এর বৈশিষ্ট্য<br>
✔️ অন্য একটি টেবিলের Primary Key-এর উপর নির্ভরশীল।<br>
✔️ ডাটা ইন্টিগ্রিটি বজায় রাখে → অর্থাৎ ভুল সম্পর্কযুক্ত ডাটা ঢুকতে দেয় না।<br>
✔️ ক্যাসকেড অপশন (CASCADE) ব্যবহার করে সম্পর্কিত ডাটা মুছে ফেলা বা আপডেট করা যায়।<br>


### <code style="color:aqua">What is the difference between the VARCHAR and CHAR data types?</code>

- VARCHAR এবং CHAR উভয়ই স্ট্রিং ডাটা টাইপ, যা টেক্সট ডাটা সংরক্ষণের জন্য ব্যবহৃত হয়। তবে, এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য রয়েছে।

CHAR(n) (Fixed Length):-
এটি একটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে।

যদি কোনো স্ট্রিং ছোট হয়, তাহলে অবশিষ্ট জায়গা ফাঁকা (padded with spaces) দিয়ে পূরণ করা হয়।

পারফরম্যান্স: CHAR ফিক্সড সাইজ হওয়ায় স্টোরেজ অপ্টিমাইজড, তবে অপ্রয়োজনীয় স্পেস সংরক্ষণ করে।

 VARCHAR(n) (Variable Length):-
এটি পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে (অর্থাৎ, শুধুমাত্র প্রয়োজনীয় জায়গা নেয়)।

যদি স্ট্রিং ছোট হয়, তবে অতিরিক্ত স্পেস সংরক্ষণ করা হয় না।

পারফরম্যান্স: সাধারণত বেশি দক্ষ ও স্টোরেজ বান্ধব, কারণ এটি অপ্রয়োজনীয় স্পেস সংরক্ষণ করে না।

### <code style="color:aqua">Explain the purpose of the WHERE clause in a SELECT statement</code>
- 🔹 WHERE ক্লজের উদ্দেশ্য :-
WHERE ক্লজ PostgreSQL-এ একটি ফিল্টারিং টুল, যা নির্দিষ্ট শর্ত অনুযায়ী ডাটা নির্বাচন করতে ব্যবহার করা হয়। এটি ডাটাবেস থেকে সুনির্দিষ্ট রেকর্ড ফেরত দিতে সাহায্য করে, যা কোয়েরির কার্যকারিতা এবং পারফরম্যান্স উন্নত করে।

✅ WHERE ক্লজ কেন ব্যবহার করা হয়?:-<br>
1️⃣ নির্দিষ্ট ডাটা নির্বাচন করতে → শুধুমাত্র প্রয়োজনীয় রেকর্ড বের করে।<br>
2️⃣ ডাটাবেস পারফরম্যান্স বাড়াতে → অপ্রয়োজনীয় ডাটা বাদ দিয়ে দ্রুত ফলাফল দেয়।<br>
3️⃣ ফিল্টারিং ও শর্ত যোগ করতে → নির্দিষ্ট ক্রাইটেরিয়ার ভিত্তিতে ডাটা ফিল্টার করা যায়<br>

### <code style="color:aqua">What are the LIMIT and OFFSET clauses used for?</code>
-  1️⃣ LIMIT ক্লজ :-
LIMIT ব্যবহার করে ফলাফলের সংখ্যার সীমা নির্ধারণ করা যায়, যাতে কেবল নির্দিষ্ট সংখ্যক রেকর্ড ফেরত আসে।

🔹 LIMIT সিনট্যাক্স:

SELECT column_name 
FROM table_name 
LIMIT number;

- 2️⃣ OFFSET ক্লজ
OFFSET ক্লজ ব্যবহার করে প্রথম কিছু সংখ্যক রেকর্ড বাদ দিয়ে পরবর্তী রেকর্ডগুলো রিটার্ন করা যায়।

🔹 OFFSET সিনট্যাক্স:

SELECT column_name 
FROM table_name 
OFFSET number;

### <code style="color:aqua">How can you modify data using UPDATE statements?</code>

-নির্দিষ্ট রেকর্ড আপডেট করা
📌 উদাহরণ: একজন কর্মীর বেতন পরিবর্তন করা

UPDATE employees 
SET salary = 60000 
WHERE id = 3;

### <code style="color:aqua">What is the significance of the JOIN operation, and how does it work in PostgreSQL?</code>

- 








