<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Satisfaction_Survey.WebForm1" %>

<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>ارزیابی عملکرد | سامانه نظرسنجی هوشمند</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', 'Segoe UI', 'Vazir', system-ui, -apple-system, sans-serif;
            background: linear-gradient(145deg, #EFF2F9 0%, #F0F4FA 100%);
            min-height: 100vh;
            padding: 30px 20px;
            position: relative;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" opacity="0.03"><path fill="none" d="M20,50 L80,50 M50,20 L50,80" stroke="%231F3A5F" stroke-width="1"/><circle cx="50" cy="50" r="30" stroke="%231F3A5F" stroke-width="0.5" fill="none"/><circle cx="50" cy="50" r="15" stroke="%231F3A5F" stroke-width="0.5" fill="none"/></svg>');
            background-repeat: repeat;
            pointer-events: none;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .corporate-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .logo-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            background: rgba(31, 58, 95, 0.08);
            backdrop-filter: blur(10px);
            padding: 10px 24px;
            border-radius: 100px;
            margin-bottom: 20px;
            border: 1px solid rgba(31, 58, 95, 0.15);
        }

        .logo-icon { font-size: 24px; }
        .logo-text {
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 1px;
            color: #1F3A5F;
            text-transform: uppercase;
        }

        .corporate-header h1 {
            font-size: 1.9rem;
            font-weight: 700;
            background: linear-gradient(135deg, #1F3A5F 0%, #2C5282 50%, #3182CE 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 8px;
        }

        .corporate-subtitle {
            color: #4A5568;
            font-size: 0.9rem;
            border-top: 1px solid #E2E8F0;
            display: inline-block;
            padding-top: 10px;
        }

        .card-premium {
            background: #FFFFFF;
            border-radius: 28px;
            padding: 28px;
            margin-bottom: 24px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.08), 0 0 0 1px rgba(0, 0, 0, 0.02);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            animation: fadeInUp 0.4s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .scanner-card {
            text-align: center;
            background: linear-gradient(145deg, #FFFFFF 0%, #F8FAFE 100%);
        }

        .qr-input {
            width: 100%;
            padding: 16px 20px;
            font-size: 1rem;
            border: 2px solid #E2E8F0;
            border-radius: 60px;
            text-align: center;
            font-family: 'Courier New', monospace;
            font-weight: 600;
            letter-spacing: 1px;
            background: #FFFFFF;
            transition: all 0.2s;
            color: #1F3A5F;
        }

        .qr-input:focus {
            outline: none;
            border-color: #D4AF37;
            box-shadow: 0 0 0 4px rgba(212, 175, 55, 0.1);
        }

        .btn-primary {
            background: linear-gradient(105deg, #1F3A5F 0%, #2C5282 100%);
            color: white;
            border: none;
            padding: 14px 32px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 60px;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 5px 15px rgba(31, 58, 95, 0.2);
        }

        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(31, 58, 95, 0.3); }
        .btn-gold {
            background: linear-gradient(105deg, #D4AF37 0%, #C5A028 100%);
            color: #1F3A5F;
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.25);
        }
        .btn-secondary {
            background: transparent;
            border: 2px solid #E2E8F0;
            color: #4A5568;
            padding: 12px 28px;
            font-weight: 600;
            border-radius: 60px;
            cursor: pointer;
        }
        .btn-secondary:hover { border-color: #D4AF37; background: rgba(212, 175, 55, 0.05); }

        .employee-badge-premium {
            background: linear-gradient(105deg, #1F3A5F 0%, #2C5282 100%);
            color: white;
            padding: 10px 24px;
            border-radius: 100px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }

        /* فرم اطلاعات فردی */
        .form-row {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            font-weight: 500;
            color: #1F3A5F;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        .form-label span {
            color: #94A3B8;
            font-weight: normal;
            font-size: 0.75rem;
        }
        .form-input, .form-select {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid #E2E8F0;
            border-radius: 16px;
            font-family: inherit;
            font-size: 0.9rem;
            transition: all 0.2s;
            background: #FFFFFF;
        }
        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: #D4AF37;
            box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.1);
        }
        .privacy-badge {
            background: #F0FDF4;
            padding: 16px;
            border-radius: 20px;
            margin: 20px 0;
            display: flex;
            align-items: center;
            gap: 12px;
            border-right: 3px solid #22C55E;
        }
        .skip-link {
            text-align: center;
            margin-top: 20px;
        }
        .skip-link button {
            background: none;
            border: none;
            color: #94A3B8;
            cursor: pointer;
            font-size: 0.85rem;
            text-decoration: underline;
        }

        .question-item-premium {
            background: #F9FBFE;
            border-radius: 20px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #EDF2F7;
        }
        .category-tag {
            display: inline-block;
            background: #EDF2F7;
            color: #1F3A5F;
            padding: 4px 16px;
            border-radius: 50px;
            font-size: 0.7rem;
            font-weight: 600;
            margin-bottom: 14px;
        }
        .question-title-premium {
            font-weight: 600;
            font-size: 1rem;
            color: #1A202C;
            margin-bottom: 18px;
            padding-right: 12px;
            border-right: 3px solid #D4AF37;
        }
        .rating-group-premium {
            display: flex;
            gap: 12px;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 16px;
        }
        .rating-option-premium {
            flex: 1;
            text-align: center;
            cursor: pointer;
        }
        .rating-option-premium input { display: none; }
        .rating-label-premium {
            display: block;
            padding: 10px 6px;
            background: white;
            border-radius: 60px;
            font-size: 0.85rem;
            font-weight: 500;
            color: #4A5568;
            transition: all 0.2s;
            cursor: pointer;
            border: 1.5px solid #E2E8F0;
        }
        .rating-option-premium input:checked + .rating-label-premium {
            background: linear-gradient(105deg, #1F3A5F 0%, #2C5282 100%);
            color: white;
            border-color: transparent;
            transform: scale(1.02);
        }
        .comment-box {
            margin-top: 14px;
            animation: slideDown 0.25s ease-out;
        }
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .comment-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #E2E8F0;
            border-radius: 20px;
            font-family: inherit;
            font-size: 0.85rem;
            resize: vertical;
        }
        .progress-section { margin-bottom: 24px; }
        .progress-stats {
            display: flex;
            justify-content: space-between;
            color: #4A5568;
            font-size: 0.8rem;
            margin-bottom: 8px;
        }
        .progress-bar-premium {
            background: #EDF2F7;
            border-radius: 20px;
            height: 8px;
            overflow: hidden;
        }
        .progress-fill {
            background: linear-gradient(90deg, #D4AF37 0%, #C5A028 100%);
            height: 100%;
            width: 0%;
            transition: width 0.4s ease;
        }
        .alert-premium {
            padding: 14px 20px;
            border-radius: 60px;
            text-align: center;
            font-weight: 500;
            margin-bottom: 20px;
        }
        .alert-error-premium {
            background: #FEF2F2;
            color: #991B1B;
            border: 1px solid #FEE2E2;
        }
        .footer-note {
            text-align: center;
            color: #94A3B8;
            font-size: 0.75rem;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #E2E8F0;
        }
        @media (max-width: 640px) {
            body { padding: 20px 16px; }
            .card-premium { padding: 18px; }
            .rating-label-premium { font-size: 0.7rem; padding: 8px 3px; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="corporate-header">
            <div class="logo-badge">
                <span class="logo-icon">🏢</span>
                <span class="logo-text">گروه صنعتی دانش بنیان</span>
            </div>
            <h1>سامانه ارزیابی عملکرد</h1>
            <div class="corporate-subtitle">نظرسنجی ۳۶۰ درجه | محرمانه و ناشناس</div>
        </div>
        <div id="app"></div>
        <div class="footer-note">اطلاعات شما محرمانه می‌ماند • این ارزیابی به بهبود کیفیت خدمات کمک می‌کند</div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/react@18.2.0/umd/react.development.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/react-dom@18.2.0/umd/react-dom.development.js"></script>
    <script>
        const QUESTIONS_DB = [
            { id: 1, category: "قانون مداری و عدم تبعیض", text: "انجام کار بر اساس ضوابط اداری و عدم دخالت قضاوت‌های شخصی" },
            { id: 2, category: "قانون مداری و عدم تبعیض", text: "عدم تبعیض بین مراجعین و رعایت عدالت سازمانی" },
            { id: 3, category: "قانون مداری و عدم تبعیض", text: "نظم، ترتیب و سهولت دسترسی به امکانات برای دریافت خدمت" },
            { id: 4, category: "قانون مداری و عدم تبعیض", text: "احساس نیاز به سفارش و توصیه‌های غیرقانونی برای دریافت خدمت" },
            { id: 5, category: "سرعت و دقت", text: "دقت کارمند در انجام کار به گونه‌ای که نیاز به دوباره‌کاری نباشد" },
            { id: 6, category: "سرعت و دقت", text: "تعداد دفعات مراجعه به سازمان برای دریافت خدمت" },
            { id: 7, category: "سرعت و دقت", text: "تعهد و پایبندی به زمان ارائه خدمت در فرم" },
            { id: 8, category: "سرعت و دقت", text: "دریافت یکباره مدارک و ارائه اطلاعات در هنگام مراجعه" },
            { id: 9, category: "ارائه راهنمایی", text: "نحوه اطلاع‌رسانی درباره مراحل انجام کار" },
            { id: 10, category: "ارائه راهنمایی", text: "نحوه اطلاع‌رسانی درباره مدارک مورد نیاز برای ارائه خدمت" },
            { id: 11, category: "ارائه راهنمایی", text: "به‌موقع بودن و شفاف بودن رسیدگی به شکایات، نظرات و پیشنهادها" },
            { id: 12, category: "ارائه راهنمایی", text: "راهنمایی، پاسخگویی و پیگیری وضعیت درخواست‌ها" },
            { id: 13, category: "کرامت و احترام", text: "نحوه رفتار و راهنمایی و پاسخگویی محترمانه" },
            { id: 14, category: "کرامت و احترام", text: "میزان رضایت شما از خدمات ارائه شده" },
            { id: 15, category: "کرامت و احترام", text: "حضور به‌موقع در محل کار و احترام به زمان مراجعان" }
        ];

        const RATING_SCORES = { "خیلی کم": 1, "کم": 2, "متوسط": 3, "زیاد": 4, "خیلی زیاد": 5 };
        const RATING_OPTIONS = ["خیلی کم", "کم", "متوسط", "زیاد", "خیلی زیاد"];
        const STORAGE_KEY = "corporate_survey_data_v3";

        function hasEmployeeSurveyed(employeeCode) {
            const responses = JSON.parse(localStorage.getItem(STORAGE_KEY) || "{}");
            return !!responses[employeeCode];
        }

        function saveSurveyResponse(employeeCode, personalInfo, answers, comments) {
            const responses = JSON.parse(localStorage.getItem(STORAGE_KEY) || "{}");
            responses[employeeCode] = {
                personalInfo: personalInfo,
                answers: answers,
                comments: comments,
                timestamp: new Date().toISOString(),
                totalScore: Object.values(answers).reduce((sum, val) => sum + (RATING_SCORES[val] || 0), 0)
            };
            localStorage.setItem(STORAGE_KEY, JSON.stringify(responses));
        }

        // صفحه اسکن QR
        function QRScannerPage({ onEmployeeSubmit }) {
            const [employeeCode, setEmployeeCode] = React.useState("");
            const [error, setError] = React.useState("");
            const handleSubmit = (e) => {
                e.preventDefault();
                if (!employeeCode.trim()) {
                    setError("کد پرسنلی را وارد کنید");
                    return;
                }
                if (hasEmployeeSurveyed(employeeCode.trim())) {
                    setError("شما قبلاً برای این پرسنل نظر خود را ثبت کرده‌اید.");
                    return;
                }
                onEmployeeSubmit(employeeCode.trim());
            };
            return React.createElement("div", { className: "card-premium scanner-card" },
                React.createElement("div", { style: { fontSize: "48px", marginBottom: "12px" } }, "📱🔍"),
                React.createElement("h3", { style: { fontSize: "1.3rem", color: "#1F3A5F", marginBottom: "10px" } }, "ورود به سامانه"),
                React.createElement("p", { style: { color: "#64748B", marginBottom: "24px" } }, "کد پرسنلی خود را اسکن کنید یا دستی وارد نمایید"),
                React.createElement("form", { onSubmit: handleSubmit },
                    React.createElement("input", { type: "text", className: "qr-input", placeholder: "مثال: EMP-۱۲۳۴۵", value: employeeCode, onChange: (e) => { setEmployeeCode(e.target.value); setError(""); }, autoFocus: true }),
                    error && React.createElement("div", { className: "alert-premium alert-error-premium", style: { marginTop: "16px" } }, error),
                    React.createElement("button", { type: "submit", className: "btn-primary", style: { marginTop: "28px", width: "100%", justifyContent: "center" } }, "✔️ ادامه")
                )
            );
        }

        // صفحه اطلاعات فردی (اختیاری)
        function PersonalInfoPage({ employeeCode, onNext }) {
            const [name, setName] = React.useState("");
            const [job, setJob] = React.useState("");
            const [age, setAge] = React.useState("");
            const [education, setEducation] = React.useState("");
            const [phone, setPhone] = React.useState("");

            const handleSubmit = (e) => {
                e.preventDefault();
                const personalInfo = { name, job, age, education, phone };
                onNext(personalInfo);
            };

            const handleSkip = () => {
                onNext({});
            };

            return React.createElement("div", { className: "card-premium" },
                React.createElement("h3", { style: { color: "#1F3A5F", marginBottom: "8px" } }, "📋 اطلاعات دموگرافیک"),
                React.createElement("p", { style: { color: "#64748B", marginBottom: "20px", fontSize: "0.85rem" } }, "این اطلاعات به تحلیل بهتر نظرات کمک می‌کند"),

                React.createElement("div", { className: "privacy-badge" },
                    React.createElement("span", { style: { fontSize: "24px" } }, "🔒"),
                    React.createElement("div", { style: { flex: 1 } },
                        React.createElement("strong", null, "کاملاً محرمانه"),
                        React.createElement("p", { style: { fontSize: "0.75rem", color: "#166534", marginTop: "4px" } }, "اطلاعات شما فقط به صورت آماری و ناشناس استفاده می‌شود")
                    )
                ),

                React.createElement("form", { onSubmit: handleSubmit },
                    React.createElement("div", { className: "form-row" },
                        React.createElement("label", { className: "form-label" }, "نام و نام خانوادگی", React.createElement("span", null, " (اختیاری)")),
                        React.createElement("input", { type: "text", className: "form-input", value: name, onChange: (e) => setName(e.target.value), placeholder: "مثال: علی محمدی" })
                    ),
                    React.createElement("div", { className: "form-row" },
                        React.createElement("label", { className: "form-label" }, "سمت / شغل", React.createElement("span", null, " (اختیاری)")),
                        React.createElement("input", { type: "text", className: "form-input", value: job, onChange: (e) => setJob(e.target.value), placeholder: "مثال: کارشناس فروش" })
                    ),
                    React.createElement("div", { className: "form-row" },
                        React.createElement("label", { className: "form-label" }, "سن", React.createElement("span", null, " (اختیاری)")),
                        React.createElement("select", { className: "form-select", value: age, onChange: (e) => setAge(e.target.value) },
                            React.createElement("option", { value: "" }, "انتخاب کنید"),
                            React.createElement("option", { value: "۱۸-۲۵" }, "۱۸-۲۵ سال"),
                            React.createElement("option", { value: "۲۶-۳۵" }, "۲۶-۳۵ سال"),
                            React.createElement("option", { value: "۳۶-۴۵" }, "۳۶-۴۵ سال"),
                            React.createElement("option", { value: "۴۶+" }, "۴۶ سال به بالا")
                        )
                    ),
                    React.createElement("div", { className: "form-row" },
                        React.createElement("label", { className: "form-label" }, "تحصیلات", React.createElement("span", null, " (اختیاری)")),
                        React.createElement("select", { className: "form-select", value: education, onChange: (e) => setEducation(e.target.value) },
                            React.createElement("option", { value: "" }, "انتخاب کنید"),
                            React.createElement("option", { value: "زیر دیپلم" }, "زیر دیپلم"),
                            React.createElement("option", { value: "دیپلم" }, "دیپلم"),
                            React.createElement("option", { value: "کارشناسی" }, "کارشناسی"),
                            React.createElement("option", { value: "کارشناسی ارشد" }, "کارشناسی ارشد"),
                            React.createElement("option", { value: "دکتری" }, "دکتری")
                        )
                    ),
                    React.createElement("div", { className: "form-row" },
                        React.createElement("label", { className: "form-label" }, "شماره تماس", React.createElement("span", null, " (اختیاری)")),
                        React.createElement("input", { type: "tel", className: "form-input", value: phone, onChange: (e) => setPhone(e.target.value), placeholder: "مثال: ۰۹۱۲۳۴۵۶۷۸۹" })
                    ),
                    React.createElement("button", { type: "submit", className: "btn-primary", style: { width: "100%", justifyContent: "center", marginTop: "10px" } }, "📝 شروع نظرسنجی"),
                    React.createElement("div", { className: "skip-link" },
                        React.createElement("button", { type: "button", onClick: handleSkip }, "پرش به نظرسنجی بدون وارد کردن اطلاعات →")
                    )
                )
            );
        }

        // صفحه سوالات
        function SurveyPage({ employeeCode, personalInfo, onComplete }) {
            const [answers, setAnswers] = React.useState({});
            const [comments, setComments] = React.useState({});

            const handleAnswer = (qId, rating) => {
                setAnswers(prev => ({ ...prev, [qId]: rating }));
                if (rating !== "خیلی کم" && rating !== "خیلی زیاد") {
                    setComments(prev => { const newC = { ...prev }; delete newC[qId]; return newC; });
                }
            };

            const answeredCount = Object.keys(answers).length;
            const totalQuestions = QUESTIONS_DB.length;
            const progress = (answeredCount / totalQuestions) * 100;
            const allAnswered = answeredCount === totalQuestions;

            const handleSubmit = () => {
                if (!allAnswered) {
                    alert(`❗ لطفاً به همه ${totalQuestions} سوال پاسخ دهید.`);
                    return;
                }
                if (window.confirm("اطلاعات ثبت شود؟ پس از ثبت امکان ویرایش وجود ندارد.")) {
                    saveSurveyResponse(employeeCode, personalInfo, answers, comments);
                    onComplete();
                }
            };

            return React.createElement(React.Fragment, null,
                React.createElement("div", { className: "card-premium" },
                    React.createElement("div", { className: "employee-badge-premium" }, `🧑‍💼 ارزیابی برای: ${employeeCode}`),
                    React.createElement("div", { className: "progress-section" },
                        React.createElement("div", { className: "progress-stats" },
                            React.createElement("span", null, `📋 ${answeredCount} از ${totalQuestions} سوال`),
                            React.createElement("span", null, `⭐ امتیاز: ${Object.values(answers).reduce((sum, v) => sum + RATING_SCORES[v], 0)} از ${totalQuestions * 5}`)
                        ),
                        React.createElement("div", { className: "progress-bar-premium" },
                            React.createElement("div", { className: "progress-fill", style: { width: `${progress}%` } })
                        )
                    )
                ),
                QUESTIONS_DB.map(q => {
                    const selected = answers[q.id];
                    const showComment = selected === "خیلی کم" || selected === "خیلی زیاد";
                    return React.createElement("div", { key: q.id, className: "card-premium question-item-premium" },
                        React.createElement("span", { className: "category-tag" }, q.category),
                        React.createElement("div", { className: "question-title-premium" }, q.text),
                        React.createElement("div", { className: "rating-group-premium" },
                            RATING_OPTIONS.map(opt =>
                                React.createElement("label", { key: opt, className: "rating-option-premium" },
                                    React.createElement("input", { type: "radio", name: `q${q.id}`, value: opt, checked: selected === opt, onChange: () => handleAnswer(q.id, opt) }),
                                    React.createElement("span", { className: "rating-label-premium" }, opt)
                                )
                            )
                        ),
                        showComment && React.createElement("div", { className: "comment-box" },
                            React.createElement("textarea", { className: "comment-input", rows: "2", placeholder: "لطفاً دلیل انتخاب این گزینه را به طور مختصر بیان کنید...", value: comments[q.id] || "", onChange: (e) => setComments(prev => ({ ...prev, [q.id]: e.target.value })) }),
                            React.createElement("div", { className: "comment-hint", style: { fontSize: "0.7rem", color: "#94A3B8", marginTop: "6px" } }, "✍️ توضیحات شما به بهبود عملکرد کمک می‌کند (اختیاری)")
                        )
                    );
                }),
                React.createElement("div", { className: "card-premium", style: { textAlign: "center" } },
                    React.createElement("button", { className: `btn-primary btn-gold`, onClick: handleSubmit, style: { width: "100%", justifyContent: "center", opacity: allAnswered ? 1 : 0.6 } }, "✨ ثبت نهایی ارزیابی")
                )
            );
        }

        function ThankYouPage() {
            React.useEffect(() => { const t = setTimeout(() => window.location.reload(), 2800); return () => clearTimeout(t); }, []);
            return React.createElement("div", { className: "card-premium", style: { textAlign: "center" } },
                React.createElement("div", { style: { fontSize: "56px", marginBottom: "16px" } }, "🏅"),
                React.createElement("h2", { style: { color: "#1F3A5F", fontWeight: "700", marginBottom: "12px" } }, "سپاس از مشارکت شما"),
                React.createElement("p", { style: { color: "#475569" } }, "نظر شما به بهبود خدمات مجموعه کمک می‌کند.")
            );
        }

        function App() {
            const [step, setStep] = React.useState("scanner");
            const [currentEmployee, setCurrentEmployee] = React.useState("");
            const [personalInfo, setPersonalInfo] = React.useState({});
            if (step === "scanner") return React.createElement(QRScannerPage, { onEmployeeSubmit: (code) => { setCurrentEmployee(code); setStep("personalInfo"); } });
            if (step === "personalInfo") return React.createElement(PersonalInfoPage, { employeeCode: currentEmployee, onNext: (info) => { setPersonalInfo(info); setStep("survey"); } });
            if (step === "survey") return React.createElement(SurveyPage, { employeeCode: currentEmployee, personalInfo: personalInfo, onComplete: () => setStep("thankyou") });
            return React.createElement(ThankYouPage, null);
        }

        window.addEventListener("load", () => {
            const el = document.getElementById("app");
            if (el && !el.hasChildNodes()) ReactDOM.createRoot(el).render(React.createElement(App));
        });
    </script>
</body>
</html>