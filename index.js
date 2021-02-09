const nodemailer = require('nodemailer');
const { SOURCE_EMAIL, SOURCE_EMAIL_PASSWORD } = process.env;

async function main() {
  const site = process.argv[2];
  const destinationEmail = process.argv[3];
  if (!site) {
    throw new Error('Site is a required argument');
  }
  if (!destinationEmail) {
    throw new Error('Site is a required argument');
  }

  const auth = { user: SOURCE_EMAIL, pass: SOURCE_EMAIL_PASSWORD };
  const transporter = nodemailer.createTransport({ service: 'gmail', auth });
  const mailOptions = {
    from: auth.user,
    to: destinationEmail,
    subject: `Site Changed: ${site}`,
    text: `Check out ${site} for updates`,
  };

  await new Promise((resolve, reject) => {
    transporter.sendMail(mailOptions, (error, info) => error ? reject(error) : resolve(info));
  });
}

main().catch(console.error);
