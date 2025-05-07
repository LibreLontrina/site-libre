 import { Link } from 'react-router-dom';
 import './LinkHome.css';
 
 export default function LinkHome({ link, text }) {
   return (
     <Link to={link} className="link">
       {text}
     </Link>
   );
 }