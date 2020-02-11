import moment from 'moment';

const INTERVAL = 10;

const logger = (text: string): void => {
  console.log(`${moment().format('DD/MM/Y HH:mm:ss')} - ${text}`);
};

let i = 1;

setInterval(() => {
  logger(`This container has been alive for ${i * INTERVAL} seconds.`);
}, INTERVAL * 1000);
